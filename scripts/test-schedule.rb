#!/usr/bin/env ruby

# Schedule parsing smoke test
# Validates that _data/schedule.yml is properly formatted

require 'yaml'
require 'date'

def validate_schedule
  schedule_file = '_data/schedule.yml'
  
  unless File.exist?(schedule_file)
    puts "❌ Schedule file not found: #{schedule_file}"
    return false
  end
  
  begin
    schedule = YAML.load_file(schedule_file)
  rescue Psych::SyntaxError => e
    puts "❌ Invalid YAML syntax in #{schedule_file}: #{e.message}"
    return false
  end
  
  unless schedule.is_a?(Hash) && schedule['scheduled_content']
    puts "❌ Schedule file must contain 'scheduled_content' array"
    return false
  end
  
  valid = true
  schedule['scheduled_content'].each_with_index do |item, index|
    # Validate required fields
    required_fields = ['date', 'content_type', 'file', 'publish', 'title']
    required_fields.each do |field|
      unless item.key?(field)
        puts "❌ Item #{index + 1}: Missing required field '#{field}'"
        valid = false
      end
    end
    
    # Validate date format
    if item['date']
      begin
        Date.parse(item['date'])
      rescue Date::Error
        puts "❌ Item #{index + 1}: Invalid date format '#{item['date']}' (use YYYY-MM-DD)"
        valid = false
      end
    end
    
    # Validate content type
    if item['content_type'] && !['post', 'article'].include?(item['content_type'])
      puts "❌ Item #{index + 1}: Invalid content_type '#{item['content_type']}' (use 'post' or 'article')"
      valid = false
    end
    
    # Validate publish flag
    if item['publish'] && ![true, false].include?(item['publish'])
      puts "❌ Item #{index + 1}: 'publish' must be true or false"
      valid = false
    end
    
    # Validate file path
    if item['file'] && !item['file'].start_with?('_posts/', '_articles/')
      puts "⚠️  Item #{index + 1}: File path '#{item['file']}' should start with '_posts/' or '_articles/'"
    end
  end
  
  if valid
    puts "✅ Schedule file validation passed"
    puts "📊 Found #{schedule['scheduled_content'].length} scheduled items"
    
    # Show summary
    today = Date.today
    pending = schedule['scheduled_content'].select { |item| !item['publish'] }
    overdue = pending.select { |item| Date.parse(item['date']) < today }
    due_today = pending.select { |item| Date.parse(item['date']) == today }
    future = pending.select { |item| Date.parse(item['date']) > today }
    
    puts "📅 Schedule summary:"
    puts "   - Overdue: #{overdue.length}"
    puts "   - Due today: #{due_today.length}"
    puts "   - Future: #{future.length}"
    puts "   - Published: #{schedule['scheduled_content'].length - pending.length}"
    
    if due_today.any?
      puts "\n📢 Due today:"
      due_today.each { |item| puts "   - #{item['title']} (#{item['file']})" }
    end
  end
  
  valid
end

# Run validation
if validate_schedule
  exit 0
else
  puts "\n🔧 Fix the issues above and run again"
  exit 1
end