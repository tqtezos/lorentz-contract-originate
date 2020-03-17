#!/usr/bin/env ruby

contract_lines = File.read('create_contracts.tz').lines

setup_lines = contract_lines.take_while{|x| !x.match(/create-contract/)}
post_setup_lines = contract_lines.drop_while{|x| !x.match(/create-contract/)}.drop_while{|x| x.match(/create-contract/)}

create_contract_lines = post_setup_lines.take_while{|x| !x.match(/end-create-contract/)}
teardown_lines = post_setup_lines.drop_while{|x| !x.match(/end-create-contract/)}.drop_while{|x| x.match(/end-create-contract/)}

puts(setup_lines + (create_contract_lines * ARGV[0].to_i) + teardown_lines)

# max size origination
# ❯❯❯ alpha-client --wait none originate contract ContractCreator601 \
#   transferring 0 from $BOB_ADDRESS running \
#   "$(./create_contracts.rb 344 | tr '\n' ' ')" \
#   --init "Unit" --burn-cap 16.707
#
# KT1JUC8ZKPDCjBn2dTvEsBirhSenmm7NUKDA

# ❯❯❯ alpha-client --wait none originate contract ContractCreator344 \                                                                                                                                                 $ 
#   transferring 0 from $BOB_ADDRESS running \
#   "$(./create_contracts.rb 172 | tr '\n' ' ')" \
#   --init "Unit" --burn-cap 8.388


alpha-client --wait none transfer 0 from $BOB_ADDRESS to KT1JUC8ZKPDCjBn2dTvEsBirhSenmm7NUKDA --arg 'Unit' --dry-run 
