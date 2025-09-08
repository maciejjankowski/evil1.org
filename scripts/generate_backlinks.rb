#!/usr/bin/env ruby
# Backlinks Generator Script for evil1.org
# This script analyzes articles and creates backlinks between related content

require 'yaml'
require 'json'
require 'fileutils'
require 'date'

class BacklinksGenerator
  def initialize(site_dir = '.')
    @site_dir = site_dir
    @articles_dir = File.join(site_dir, '_articles')
    @data_dir = File.join(site_dir, '_data')
    @output_file = File.join(@data_dir, 'backlinks.yml')
  end

  def generate_backlinks
    puts "🔍 Analyzing articles for backlinks..."

    articles = load_articles
    puts "📊 Found #{articles.length} articles"
    backlinks_data = {}

    articles.each do |article_file, article_data|
      puts "🔗 Processing: #{article_data['title']}"
      backlinks_data[article_data['url']] = find_related_articles(article_file, article_data, articles)
    end

    puts "💾 Saving backlinks data..."
    save_backlinks(backlinks_data)
    puts "✅ Backlinks generated successfully!"
    puts "📄 Backlinks data saved to: #{@output_file}"
  end

  private

  def load_articles
    articles = {}

    Dir.glob(File.join(@articles_dir, '*.md')).each do |file|
      puts "📄 Loading: #{File.basename(file)}"
      content = File.read(file)
      front_matter = extract_front_matter(content)

      if front_matter
        url = generate_url(file)
        articles[file] = front_matter.merge('url' => url, 'file' => file)
        puts "✅ Loaded: #{front_matter['title']}"
      else
        puts "❌ Failed to load front matter for: #{File.basename(file)}"
      end
    end

    articles
  end

  def extract_front_matter(content)
    return nil unless content.start_with?('---')

    end_index = content.index('---', 3)
    return nil unless end_index

    front_matter_text = content[3...end_index]
    parse_front_matter_manually(front_matter_text)
  end

  def parse_front_matter_manually(text)
    data = {}
    text.each_line do |line|
      line.strip!
      next if line.empty?

      if line.include?(':')
        key, value = line.split(':', 2)
        key = key.strip
        value = value.strip if value

        # Handle arrays
        if value&.start_with?('[') && value&.end_with?(']')
          data[key] = value[1...-1].split(',').map(&:strip)
        # Handle dates
        elsif value&.match?(/^\d{4}-\d{2}-\d{2}$/)
          begin
            data[key] = Date.parse(value)
          rescue
            data[key] = value
          end
        else
          data[key] = value
        end
      end
    end
    data
  end

  def generate_url(file)
    filename = File.basename(file, '.md')
    "/articles/#{filename}/"
  end

  def find_related_articles(current_file, current_data, all_articles)
    related = []
    current_tags = current_data['tags'] || []
    current_categories = current_data['categories'] || []
    current_title = current_data['title'] || ''

    all_articles.each do |file, data|
      next if file == current_file

      relevance_score = calculate_relevance(current_data, data, current_title)

      if relevance_score > 0
        related << {
          'title' => data['title'],
          'url' => data['url'],
          'description' => data['description'],
          'relevance_score' => relevance_score,
          'shared_tags' => find_shared_items(current_tags, data['tags'] || []),
          'shared_categories' => find_shared_items(current_categories, data['categories'] || [])
        }
      end
    end

    # Sort by relevance score and return top matches
    related.sort_by { |r| -r['relevance_score'] }.first(8)
  end

  def calculate_relevance(current_data, other_data, current_title)
    score = 0

    # Tag matching (high weight)
    current_tags = current_data['tags'] || []
    other_tags = other_data['tags'] || []
    shared_tags = find_shared_items(current_tags, other_tags)
    score += shared_tags.length * 3

    # Category matching (high weight)
    current_categories = current_data['categories'] || []
    other_categories = other_data['categories'] || []
    shared_categories = find_shared_items(current_categories, other_categories)
    score += shared_categories.length * 2

    # Title keyword matching (medium weight)
    current_keywords = extract_keywords(current_title)
    other_title = other_data['title'] || ''
    other_keywords = extract_keywords(other_title)
    shared_keywords = find_shared_items(current_keywords, other_keywords)
    score += shared_keywords.length * 1

    # Content similarity (if descriptions exist)
    if current_data['description'] && other_data['description']
      current_desc_words = current_data['description'].downcase.split
      other_desc_words = other_data['description'].downcase.split
      shared_words = find_shared_items(current_desc_words, other_desc_words)
      score += shared_words.length * 0.5
    end

    score
  end

  def find_shared_items(array1, array2)
    array1 & array2
  end

  def extract_keywords(text)
    return [] unless text

    # Remove common words and extract meaningful keywords
    stop_words = ['the', 'a', 'an', 'and', 'or', 'but', 'in', 'on', 'at', 'to', 'for', 'of', 'with', 'by', 'how', 'why', 'what', 'when', 'where', 'who']

    words = text.downcase.gsub(/[^\w\s]/, '').split
    words.reject { |word| stop_words.include?(word) || word.length < 3 }.uniq
  end

  def save_backlinks(data)
    FileUtils.mkdir_p(@data_dir)
    File.write(@output_file, data.to_yaml)
  end
end

# Run the generator if this script is executed directly
if __FILE__ == $0
  generator = BacklinksGenerator.new(ARGV[0] || '.')
  generator.generate_backlinks
end
