[![Gem Version](https://badge.fury.io/rb/lorentz-contract-originate.svg)](https://badge.fury.io/rb/lorentz-contract-originate)

# Lorentz::Contract::Originate

Use `.yaml` files to specify:
- users
- contract originations
- transactions

in a declarative manner, a la `Makefile`'s.

For example:

```yaml
config:
  base-config: &base-config
    tezos_client_path:
      "tezos-client -A rpcalpha.tzbeta.net -P 443 -S"
    user_address:
      tz1R3vJ5TV8Y5pVj8dicBR23Zv8JArusDkYr
    param_path:
      /Users/michaelklein/Coding/forwarder-contract
    stack_path:
      /Users/michaelklein/Coding/forwarder-contract/stack

do:
  - user:
      name:
        Alice
      address:
        tz1R3vJ5TV8Y5pVj8dicBR23Zv8JArusDkYr

  - originate: &originate-forwarder
      alias: ValidatedForwarder1
      config: $base-config
      command: dstoken-forwarder-contract print-validated-expiring --central-wallet tz1R3vJ5TV8Y5pVj8dicBR23Zv8JArusDkYr --dstoken-address tz1R3vJ5TV8Y5pVj8dicBR23Zv8JArusDkYr
      storage_command: dstoken-forwarder-contract initial-storage-validated-expiring
      initial_storage:
        dstoken-address: $Alice
        whitelisted-investors: '"[\"alice\"]"'
        token-limit: 10
        expiration-date: "$(date -u -d '9:00 next Fri' +%FT%T.%NZ)"
      burn_cap: '1.644'

  - run: &validate-forwarder
      alias: RejectsNonWhitelistedUser
      config: $base-config
      contract: ValidatedForwarder1
      command: dstoken-forwarder-contract validate-transfer
      parameters:
        received-amount: 3
        from-user: "bob"
      burn_cap: '0.000001'
      expect_failure: true
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lorentz-contract-originate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lorentz-contract-originate


## Usage

```bash
❯❯❯ bundle exec ruby exe/lorentz-contract-originate.rb test.yaml
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tqtezos/lorentz-contract-originate.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

