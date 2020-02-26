#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--user ADDRESS') { |o| options[:user] = o }
  opt.on('--value NAT') { |o| options[:value] = o }
end.parse!

puts "Pair #{options[:user].inspect} #{options[:value]}"

