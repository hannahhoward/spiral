#!/usr/bin/env ruby
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'spiral'))

if ARGV[0]
  spiral = Spiral.new
  spiral.generate(ARGV[0].to_i)
  spiral.print
else
  puts("No number given to generate a spiral matrix for")
end
