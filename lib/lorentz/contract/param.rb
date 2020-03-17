require "tezos/client"
require "lorentz/contract/kernel"
require "tezos/client/utils"
require "yaml"

module Lorentz
  module Contract
    class Param
      include Lorentz::Contract::Kernel

      @originated_contracts = {}
      @ran_calls = {}
      @users = {}

      class << self
        attr_accessor :originated_contracts, :ran_calls, :users
      end

      attr_accessor :config, :command, :storage_command, :storage_params, :burn_cap

      def path
        self.config['param_path']
      end

      def stack_path
        self.config['stack_path']
      end

      def stack_exec
        if self.stack_path.nil?
          ""
        else
          "#{self.stack_path} exec -- "
        end
      end

      def initialize(config, command, storage_command, storage_params, burn_cap)
        @config = config
        @command = File.expand_path(command)
        @storage_command = File.expand_path(storage_command)
        @storage_params = storage_params
        @burn_cap = burn_cap
      end

      def self.originated_contracts_path(file_path)
        File.basename(file_path, '.yaml') + ".originated.yaml"
      end

      def self.save_originated_contracts(file_path, yaml_configs)
        File.write(self.originated_contracts_path(file_path), YAML.dump({'config' => yaml_configs, 'originated' => self.originated_contracts, 'ran' => self.ran_calls}))
      end

      def self.init_originated_contracts(file_path, yaml_configs)
        originated_contracts_path = self.originated_contracts_path(file_path)
        self.originated_contracts = if File.exist?(originated_contracts_path)
          originated_yaml = self.recursive_yaml(originated_contracts_path)
          originated_configs = originated_yaml['config']
          unless originated_configs == yaml_configs
            puts YAML.dump(yaml_configs)
            puts("-" * 50)
            puts YAML.dump(originated_configs)
            raise "expected 'config' fields in #{file_path} and #{originated_contracts_path} to match"
          end
          self.ran_calls = originated_yaml['ran']
          originated_yaml['originated']
        else
          self.save_originated_contracts file_path, yaml_configs
          {}
        end
      end

      def self.find_originated_contract(contract_alias, origination)
        if self.originated_contracts.has_key?(contract_alias) &&
           !self.originated_contracts[contract_alias].nil? &&
           !self.originated_contracts[contract_alias]&.[]('address').nil?
          puts "#{contract_alias} already originated: #{self.originated_contracts[contract_alias]}"
          puts
          existing_origination = self.originated_contracts[contract_alias]
          unless origination['config'] == existing_origination['config']
            raise "#{contract_alias} originated with:\n#{existing_origination} \nbut found #{origination}"
          end
          existing_origination
        end
      end

      def self.find_ran_call(contract_call_alias, ran_call)
        if self.ran_calls.has_key?(contract_call_alias) &&
           !self.ran_calls[contract_call_alias].nil? &&
           (!self.ran_calls[contract_call_alias]&.[]('operation_hash').nil? || !self.ran_calls[contract_call_alias]&.[]('error_message').nil?)
          puts "#{contract_call_alias} already ran: #{self.ran_calls[contract_call_alias]}"
          puts
          existing_ran_call = self.ran_calls[contract_call_alias]
          unless ran_call['config'] == existing_ran_call['config']
            raise "#{contract_call_alias} ran with:\n#{existing_ran_call} \nbut found #{ran_call}"
          end
          existing_ran_call
        end
      end


      def self.all_names()
        self.originated_contracts.to_a.map do |k,originated_contract|
          [k, originated_contract['address']]
        end.to_h.merge(self.users) do |user,x,y|
          if x == y
            x
          else
            raise "redefined #{user} as a user"
          end
        end
      end

      def self.recursive_yaml(file_path) #, raw=false)
        if file_path.nil? || File.extname(file_path).downcase != '.yaml'
          raise "No path to a *.yaml file provided"
        end
        yaml = YAML.safe_load(File.read(file_path), [Enumerator], [], true, file_path)
        if yaml.has_key?('<<')
          Dir.chdir("#{File.dirname(file_path)}") do
            included = YAML.safe_load(File.read(yaml['<<']), [], [], true, yaml['<<'])
            yaml = included.merge(yaml)
          end
        end
        yaml
        # if raw
        #   yaml = YAML.load(File.read(file_path))
        #   if contained_file_path = yaml['<<']
        #     YAML.load(self.recursive_yaml(contained_file_path, raw=true) + "\n" + File.read(file_path))
        #   else
        #     yaml
        #   end
        # else
        #   raw_file = File.read(file_path)
        #   yaml = begin
        #     YAML.load(raw_file)
        #   rescue => e
        #     {}
        #   end
        #
        #   if contained_file_path = yaml['<<']
        #     YAML.load(self.recursive_yaml(contained_file_path, raw=true) + "\n" + raw_file)
        #   else
        #     raw_file
        #   end
        # end
      end

      def self.from_yaml(file_path)
        yaml = self.recursive_yaml(file_path)
        yaml_configs = yaml['config']

        yaml['do'].each do |action|
          if action.is_a?(Hash) && action.has_key?('user')
            new_user = action.delete 'user'
            new_user_name = new_user.delete 'name'
            new_user_address = new_user.delete 'address'
            if self.users.has_key?(new_user_name)
              unless self.users[new_user_name] == new_user_address
                raise "user #{new_user_name} has two addresses: #{self.users[new_user_name]} #{new_user_address}"
              end
            else
              self.users[new_user_name] = new_user_address
            end
          elsif action.is_a?(Hash) && action.has_key?('originate')
            origination = action.delete 'originate'
            unless origination.has_key?('alias')
              raise "origination must have 'alias' key"
            end
            contract_alias = origination['alias']

            self.init_originated_contracts file_path, yaml_configs
            if !self.find_originated_contract(contract_alias, origination).nil?
            else
              origination_config = origination['config']
              aliased_origination_config = origination_config
              if origination_config.match(/^\$/)
                aliased_origination_config = yaml_configs[origination_config[1..-1]]
              end
              begin_time = Time.now
              tezos_client = Tezos::Client.new(aliased_origination_config['tezos_client_path'], aliased_origination_config['user_address'])
              lorentz_contract =
                Param.new(aliased_origination_config,
                          origination['command'],
                          origination['storage_command'],
                          origination['initial_storage'],
                          origination['burn_cap'])
              origination_result_hash =
                lorentz_contract.originate(tezos_client,
                                           contract_alias,
                                           self.all_names)
              originated_contract_hash = { 'config' => origination_config,
                                           'duration' => Time.now - begin_time
              }
              originated_contract_hash.merge! origination_result_hash.stringify_keys
              self.originated_contracts[contract_alias] = originated_contract_hash

              # Commit ASAP to prevent the need to re-originate if some part fails
              self.save_originated_contracts file_path, yaml_configs
            end
          elsif action.is_a?(Hash) && action.has_key?('run')
            contract_call = action.delete 'run'
            unless contract_call.has_key?('alias')
              raise "contract_call must have 'alias' key"
            end
            contract_call_alias = contract_call['alias']

            if !self.find_ran_call(contract_call_alias, contract_call).nil?
            else
              contract_call_config = contract_call['config']
              aliased_contract_call_config = contract_call_config
              if contract_call_config.match(/^\$/)
                aliased_contract_call_config = yaml_configs[contract_call_config[1..-1]]
              end
              begin_time = Time.now
              tezos_client = Tezos::Client.new(aliased_contract_call_config['tezos_client_path'], aliased_contract_call_config['user_address'])
              lorentz_contract_call =
                Call.new(aliased_contract_call_config,
                         contract_call['contract'],
                         contract_call['command'],
                         contract_call['parameters'],
                         contract_call['burn_cap'],
                         contract_call['expect_failure'])

              contract_call_result =
                lorentz_contract_call.contract_call(tezos_client,
                                                    contract_alias)
              ran_call_hash = {
                'contract' => contract_call['contract'],
                'parameters' => contract_call['parameters'],
                'config' => contract_call_config,
                'duration' => Time.now - begin_time 
              }
              ran_call_hash.merge! contract_call_result.stringify_keys
              self.ran_calls[contract_call_alias] = ran_call_hash

              # Commit ASAP to prevent the need to re-run if some part fails
              self.save_originated_contracts file_path, yaml_configs
            end
          else
            raise "unexpected action: #{action.inspect}"
          end
        end
      end

      def in_path(&block)
        Dir.chdir(self.path, &block)
      end

#       def originate_cmd(tezos_client, contract_name, names)
#         tezos_client.originate_cmd(contract_name,
#                                    self.print(),
#                                    self.storage(names),
#                                    @burn_cap)
#       end

      def originate(tezos_client, contract_name, names)
        tezos_client.originate(contract_name,
                               self.print(),
                               self.storage(names),
                               @burn_cap)
      end

      def print()
        @contract_code || (@contract_code = self.in_path do
          self.system_line "#{self.stack_exec}#{@command} --oneline"
        end)
      end

      def storage(names)
        @storage_code || (@storage_code =
          storage_param_args = storage_params.to_a.map do |storage_param, storage_param_arg|
            if storage_param_arg.to_s.match(/^\$/)
              param_var = storage_param_arg.to_s[1..-1]
              if names.has_key?(param_var) && !names[param_var].nil?
                storage_param_arg = names[param_var]
              end
            end
            "--#{storage_param} #{storage_param_arg}"
          end.join(' ')

          self.in_path do
            self.system_line("#{self.stack_exec}#{@storage_command} " + storage_param_args)
          end
        )
      end
    end
  end
end

# in same file as Lorentz::Contract::Param since they're mutually recursive
module Lorentz
  module Contract
    class Call < Param
      attr_accessor :config, :contract_address, :burn_cap, :expect_failure

      def initialize(config, contract_address, command, parameters, burn_cap, expect_failure=false)
        @config = config
        @contract_address = contract_address
        @storage_command = File.expand_path(command)
        @storage_params = parameters
        @burn_cap = burn_cap
        @expect_failure = expect_failure.to_s.match(/t(rue)?/i)
      end

      def contract_address
        if /^\$/ === @contract_address
          found_address = LorentzContractParam.all_names[@contract_address[1..-1]]
          if !found_address.nil?
            @contract_address = found_address
          else
            @contract_address
          end
        else
          @contract_address
        end
      end

      def michelson_parameters
        Param.instance_method(:storage).bind(self).call(Param.all_names)
      end

      def contract_call(tezos_client, contract_call_alias)
        begin
          tezos_client.contract_call(self.contract_address,
                                     self.michelson_parameters,
                                     self.burn_cap)
        rescue Lorentz::Contract::Kernel::ContractError => e
          if self.expect_failure
            return { 'error_message': e.message_list.map(&:chomp) }
          else
            raise e
          end
        end
      end
    end
  end
end

