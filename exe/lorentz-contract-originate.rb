require 'lorentz/contract/param'
require 'tezos/client'

if __FILE__ == $0
  if ARGV[1]&.strip == 'info'
    file_path = ARGV[0]
    originated_contracts_path = Lorentz::Contract::Param.originated_contracts_path(file_path)
    originated_yaml = Lorentz::Contract::Param.recursive_yaml(originated_contracts_path)
    # YAML.load(File.read(originated_contracts_path))
    originated_yaml['originated'].each do |contract|
      p contract
      contract_address = contract[1]['address']
      base_config = originated_yaml['config']['base-config']
      tezos_client = Tezos::Client.new(base_config['tezos_client_path'], base_config['user_address'])
      tezos_client.get_storage(contract_address).to_a
    end
  end

  Lorentz::Contract::Param.from_yaml ARGV[0]
end
