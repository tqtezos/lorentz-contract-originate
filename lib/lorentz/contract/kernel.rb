require 'open3'
require "lorentz/contract/enumerable"

include Lorentz::Contract::Enumerable

module Lorentz
  module Contract
    module Kernel
      class SystemError < StandardError
        attr_accessor :message_list

        def initialize(msg)
          super
        end
      end

      def system_lines(cmd)
        num_retries = 0
        result_lines = []
        begin
          result_lines = []
          puts cmd
          Open3.popen2e(cmd) do |stdin, stdout, thread|
            while line=stdout.gets do
              puts(line)
              result_lines << line
            end
            exit_status = thread.value
            unless exit_status.success?
              result_lines = result_lines.reject! do |line|
                line.match /^\s+\d{3}:\s/
              end.to_a
              err = SystemError.new(result_lines.inspect)
              err.message_list = result_lines
              raise err
            end
          end
          return result_lines.to_enum
        rescue SystemError => e
          if e.message_list.any?{|line|line.match(/Counter \d+ already used for contract/)}
            num_retries += 1
            puts
            puts "Retry number: #{num_retries}"
            retry
          end
          raise e
        end
      end

      def system_line(cmd)
        if result = system_lines(cmd)
          result.first&.chomp
        else
          result
        end
      end

      def system_operation_hash(cmd)
        system_lines(cmd).find_operation_hash
      end
    end
  end
end

