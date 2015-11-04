#!/usr/bin/env ruby
# encoding: utf-8

f = File.open('all.md', 'w')
f.puts <<-EOS
All Screenshots
===============
EOS

repos = Dir['*/'].map do |d|
  f.puts "\n## [#{d}](https://github.com/rhysd/#{d})"
  Dir["#{d}/**"]
    .select{|p| p =~ /\.(:?gif|jpg|png|svg)$/}
    .each do |p|
      f.puts "* [#{File.basename p}](#{p})"
      f.puts "\n![](#{p})\n\n"
    end
end

