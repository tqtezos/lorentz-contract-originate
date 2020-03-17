#!/usr/bin/env ruby

if ARGV.length < 1
  raise "The first argument is a file to 'cat', but got: #{ARGV}"
end

Dir.chdir(__dir__) do
  puts File.read(ARGV[0]).lines.map(&:chomp).join(' ')
end

