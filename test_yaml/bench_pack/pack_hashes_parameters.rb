#!/usr/bin/env ruby

require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.on('--user ADDRESS') { |o| options[:user] = o }
  opt.on('--value NAT') { |o| options[:value] = o }
  opt.on('--multiple NAT') { |o| options[:multiple] = o }
end.parse!

result = ""
pair_str = "Pair #{options[:user].inspect} #{options[:value]}"
multiple = options[:multiple].to_i

if 0 < multiple
  (multiple - 1).times do
    result += "#{pair_str}; "
  end
  result = "{#{result} #{pair_str}}"
else
  result = "{}"
end

puts result
