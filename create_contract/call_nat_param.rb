#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--value NATURAL') { |o| options[:value] = o }
end.parse!

puts "#{options[:value]}"

