require "lorentz/contract/enumerable"
require "lorentz/contract/kernel"
require "tezos/client/utils"

module Tezos
  class Client
    include Lorentz::Contract::Kernel

    attr_accessor :tezos_client_path, :user_address

    def initialize(tezos_client_path, user_address)
      @tezos_client_path = tezos_client_path
      @user_address = user_address
    end

    def get_receipt(operation_hash)
      result = nil
      while result.nil?
        begin
          result = if result_lines = self.system_lines("#{@tezos_client_path} get receipt for #{operation_hash}")
            unless result_lines.any?{|line| line.match /Couldn't find operation/}
              result_lines
            end
          end
        rescue ContractError
        end
      end
      result
    end

    def originate_cmd(contract_name, contract_code, initial_storage, burn_cap)
      "#{self.tezos_client_path} --wait none originate contract #{contract_name}" +
      [ "transferring 0 from #{self.user_address} running",
        contract_code.inspect,
        if initial_storage.nil? then "" else "--init #{initial_storage.inspect}" end,
        "--burn-cap #{burn_cap}"
      ].map do |line|
        "  #{line} \\"
      end.join("\n") + "\n  --force"
    end

    def originate(contract_name, contract_code, initial_storage, burn_cap)
      if operation_hash = self.system_operation_hash(self.originate_cmd(contract_name, contract_code, initial_storage, burn_cap))&.[](:operation_hash)
        self.get_receipt(operation_hash).find_originated_contract
      end
    end

    def contract_call_cmd(contract_address, parameter, burn_cap)
      "#{self.tezos_client_path} --wait none transfer 0 from #{self.user_address} " +
      [ "to #{contract_address}",
        if parameter.nil? then "" else "--arg #{parameter.inspect}" end,
        "--burn-cap #{burn_cap}"
      ].map do |line|
        "  #{line} \\"
      end.join("\n")
    end

    def contract_call(contract_address, parameter, burn_cap)
      if operation_hash = self.system_operation_hash(self.contract_call_cmd(contract_address, parameter, burn_cap))
        result_hash = { 'receipt' => self.get_receipt(operation_hash[:operation_hash]).to_a }
        result_hash.merge operation_hash.stringify_keys
      end
    end

    def get_storage_cmd(contract_address)
      "#{self.tezos_client_path} get contract storage for  #{contract_address}"
    end

    def get_storage(contract_address)
      self.system_lines(self.get_storage_cmd(contract_address))
    end
  end
end

