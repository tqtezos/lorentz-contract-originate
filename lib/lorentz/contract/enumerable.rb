
module Lorentz
  module Contract
    module Enumerable
      def find_operation_hash
        self.map do |line|
          line.chomp
        end.select do |line|
          line.match /^Operation hash is '/
        end.map do |line|
          line.sub(/Operation hash is '(.*)'/, '\1')
        end.first
      end

      def pairs(&block)
        self.zip(self.drop(1), &block)
      end

      def find_originated_contract
        self.map do |lines|
          lines.chomp
        end.pairs.select do |x,_|
          x.match /^\s+Originated contracts:/
        end.map do |_,y|
          y.strip
        end.first
      end
    end
  end
end

