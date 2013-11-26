#!/usr/bin/env ruby

require './checker.rb'
if ARGV.empty?
  puts "Please supply a path to a words file."
else
  puts FourLetterTokens::Checker.new('./dictionary.txt')
end
0