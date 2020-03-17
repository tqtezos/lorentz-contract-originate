#!/usr/bin/env ruby

require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--value STRING') { |o| options[:value] = o }
  opt.on('--contract ADDRESS') { |o| options[:contract] = o }
end.parse!

puts "Pair #{options[:value].inspect} #{options[:contract].inspect}"

