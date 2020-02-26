#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |opt|
  # opt.on('--value NATURAL') { |o| options[:value] = o }
  # opt.on('--contract ADDRESS') { |o| options[:contract] = o }
end.parse!

puts "Unit"

