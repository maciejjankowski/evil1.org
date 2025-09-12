#!/usr/bin/env ruby
require 'yaml'
require 'date'

SCHEDULE_FILE = File.expand_path('../../_data/schedule.yml', __FILE__)

unless File.exist?(SCHEDULE_FILE)
  puts "No schedule file found at #{SCHEDULE_FILE}."
  exit 0
end

begin
  data = YAML.load_file(SCHEDULE_FILE)
  unless data.is_a?(Array)
    puts "Schedule file parsed but expected an array of entries."
    exit 1
  end
  # Validate keys
  data.each_with_index do |entry, idx|
    unless entry['date'] && entry['title']
      puts "Schedule entry #{idx} missing 'date' or 'title'\n"
      exit 1
    end
    Date.parse(entry['date']) rescue (puts "Invalid date in entry #{idx}: #{entry['date']}"; exit 1)
  end
  puts "Schedule parsing OK (#{data.size} entries)."
  exit 0
rescue Psych::SyntaxError => e
  puts "YAML parse error: #{e.message}"
  exit 1
end
