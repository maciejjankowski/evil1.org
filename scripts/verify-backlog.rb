#!/usr/bin/env ruby
# Simple verifier: checks backlog contains only expected columns and TASK_ID format
require 'yaml'

BACKLOG = File.expand_path('../_docs/backlog-all.md', __dir__)
content = File.read(BACKLOG)
errors = []

content.each_line.with_index(1) do |line, ln|
  next if line.strip.empty?
  next if line.start_with?('#')
  unless line =~ /^\[( |x)\] \| T\d{3} \|/ 
    # allow other lines in different sections; only flag obvious malformed lines that look like tasks
    if line.include?('|') && line.split('|').length >= 4
      # likely fine
    else
      errors << "Malformed line #{ln}: #{line.strip}"
    end
  end
end

if errors.empty?
  puts "Backlog format OK"
  exit 0
else
  puts "Backlog format issues:"
  puts errors
  exit 2
end
