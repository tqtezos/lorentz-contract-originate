
module Lorentz
  module Contract
    module Enumerable
      PAID_STORAGE_SIZE_DIFF_REGEX = /\s+Paid storage size diff:\s+(?<paid_storage_size_diff>\d+)\s+bytes/
      CONSUMED_GAS_REGEX = /\s+Consumed gas: (?<consumed_gas>\d+)/

      def find_operation_hash
        paid_storage_size_diff = nil
        consumed_gas = nil
        operation_hash = self.map do |line|
          line.chomp!
          if (matching = line.match(PAID_STORAGE_SIZE_DIFF_REGEX))
            paid_storage_size_diff = matching[:paid_storage_size_diff]
          end
          if (matching = line.match(CONSUMED_GAS_REGEX))
            consumed_gas = matching[:consumed_gas]
          end
          line
        end.select do |line|
          line.match /^Operation hash is '/
        end.map do |line|
          line.sub(/Operation hash is '(.*)'/, '\1')
        end.first
        result_hash = { operation_hash: operation_hash }
        result_hash[:paid_storage_size_diff] = paid_storage_size_diff if paid_storage_size_diff
        result_hash[:consumed_gas] = consumed_gas if consumed_gas
        result_hash
      end

      def pairs(&block)
        self.zip(self.drop(1), &block)
      end

      def find_originated_contract
        paid_storage_size_diff = nil
        consumed_gas = nil
        originated_contract_address = self.map do |line|
          line.chomp!
          if (matching = line.match(PAID_STORAGE_SIZE_DIFF_REGEX))
            paid_storage_size_diff = matching[:paid_storage_size_diff]
          end
          if (matching = line.match(CONSUMED_GAS_REGEX))
            consumed_gas = matching[:consumed_gas]
          end
          line
        end.pairs.select do |x,_|
          x.match /^\s+Originated contracts:/
        end.map do |_,y|
          y.strip
        end.first
        result_hash = { address: originated_contract_address }
        result_hash[:paid_storage_size_diff] = paid_storage_size_diff if paid_storage_size_diff
        result_hash[:consumed_gas] = consumed_gas if consumed_gas
        result_hash
      end
    end
  end
end

