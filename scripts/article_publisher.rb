#!/usr/bin/env ruby
# Article Publisher Script for evil1.org
# This script creates article files from form submissions

require 'yaml'
require 'fileutils'
require 'date'
require 'json'

class ArticlePublisher
  def initialize(articles_dir = '_articles')
    @articles_dir = articles_dir
    @data_dir = '_data'
    ensure_directories_exist
  end

  def publish_article(article_data)
    puts "📝 Publishing article: #{article_data['title']}"

    # Generate filename
    filename = generate_filename(article_data['title'])
    filepath = File.join(@articles_dir, "#{filename}.md")

    # Create front matter
    front_matter = generate_front_matter(article_data)

    # Create full content
    content = front_matter + "\n" + (article_data['content'] || '')

    # Write file
    File.write(filepath, content)

    puts "✅ Article published: #{filepath}"

    # Update any relevant data files
    update_data_files(article_data)

    {
      success: true,
      filepath: filepath,
      filename: filename,
      url: "/articles/#{filename}/"
    }
  end

  def save_draft(article_data)
    puts "💾 Saving draft: #{article_data['title']}"

    draft_dir = File.join(@data_dir, 'drafts')
    FileUtils.mkdir_p(draft_dir)

    filename = generate_filename(article_data['title'])
    filepath = File.join(draft_dir, "#{filename}.json")

    # Add metadata
    article_data['saved_at'] = Time.now.iso8601
    article_data['status'] = 'draft'

    File.write(filepath, JSON.pretty_generate(article_data))

    puts "✅ Draft saved: #{filepath}"

    { success: true, filepath: filepath }
  end

  def list_recent_articles(limit = 10)
    articles = []

    Dir.glob(File.join(@articles_dir, '*.md')).each do |file|
      next unless File.file?(file)

      content = File.read(file)
      if content =~ /^---\n(.*?\n)---/m
        begin
          front_matter = YAML.load($1)
          articles << {
            title: front_matter['title'],
            date: front_matter['date'],
            author: front_matter['author'],
            filename: File.basename(file, '.md')
          }
        rescue
          next
        end
      end
    end

    articles.sort_by { |a| a[:date] }.reverse.first(limit)
  end

  def get_stats
    articles = Dir.glob(File.join(@articles_dir, '*.md')).count
    drafts = Dir.glob(File.join(@data_dir, 'drafts', '*.json')).count

    # Mock additional stats - in real implementation, these would come from analytics
    {
      total_articles: articles,
      total_drafts: drafts,
      published_this_month: count_articles_this_month,
      total_views: 15420, # Mock data
      avg_reading_time: '8 min' # Mock data
    }
  end

  private

  def ensure_directories_exist
    FileUtils.mkdir_p(@articles_dir)
    FileUtils.mkdir_p(@data_dir)
    FileUtils.mkdir_p(File.join(@data_dir, 'drafts'))
  end

  def generate_filename(title)
    title.downcase
         .gsub(/[^a-z0-9\s]/, '')
         .gsub(/\s+/, '-')
         .gsub(/-+/, '-')
         .gsub(/^-|-$/, '')
  end

  def generate_front_matter(data)
    front_matter = {
      'layout' => 'article',
      'title' => data['title'],
      'author' => data['author'] || 'Editorial Team',
      'date' => data['publishedAt'] || Time.now.strftime('%Y-%m-%d'),
      'description' => data['description'],
      'tags' => parse_tags(data['tags']),
      'published' => true
    }

    # Add optional fields
    front_matter['categories'] = [data['category']] if data['category'] && !data['category'].empty?
    front_matter['featured'] = true if data['featured']

    # Generate YAML
    yaml_content = front_matter.to_yaml
    "---\n#{yaml_content}---"
  end

  def parse_tags(tags_string)
    return [] unless tags_string
    tags_string.split(',').map(&:strip).reject(&:empty?)
  end

  def update_data_files(article_data)
    # Update tags data if needed
    update_tags_data(article_data)

    # Update authors data if needed
    update_authors_data(article_data)

    # Update categories data if needed
    update_categories_data(article_data)
  end

  def update_tags_data(article_data)
    tags_file = File.join(@data_dir, 'tags.yml')
    tags_data = load_yaml_file(tags_file) || {}

    if article_data['tags']
      parse_tags(article_data['tags']).each do |tag|
        tags_data[tag] ||= { 'count' => 0, 'articles' => [] }
        tags_data[tag]['count'] += 1
        tags_data[tag]['articles'] << article_data['title']
      end

      File.write(tags_file, tags_data.to_yaml)
    end
  end

  def update_authors_data(article_data)
    authors_file = File.join(@data_dir, 'authors.yml')
    authors_data = load_yaml_file(authors_file) || {}

    author = article_data['author'] || 'Editorial Team'
    authors_data[author] ||= { 'article_count' => 0, 'articles' => [] }
    authors_data[author]['article_count'] += 1
    authors_data[author]['articles'] << article_data['title']

    File.write(authors_file, authors_data.to_yaml)
  end

  def update_categories_data(article_data)
    categories_file = File.join(@data_dir, 'categories.yml')
    categories_data = load_yaml_file(categories_file) || {}

    if article_data['category']
      category = article_data['category']
      categories_data[category] ||= { 'count' => 0, 'articles' => [] }
      categories_data[category]['count'] += 1
      categories_data[category]['articles'] << article_data['title']

      File.write(categories_file, categories_data.to_yaml)
    end
  end

  def load_yaml_file(filepath)
    return {} unless File.exist?(filepath)
    YAML.load_file(filepath) || {}
  rescue
    {}
  end

  def count_articles_this_month
    current_month = Time.now.strftime('%Y-%m')
    count = 0

    Dir.glob(File.join(@articles_dir, '*.md')).each do |file|
      content = File.read(file)
      if content =~ /^---\n(.*?\n)---/m
        begin
          front_matter = YAML.load($1)
          article_month = front_matter['date'].to_s[0..6] if front_matter['date']
          count += 1 if article_month == current_month
        rescue
          next
        end
      end
    end

    count
  end
end

# CLI interface
if __FILE__ == $0
  publisher = ArticlePublisher.new

  case ARGV[0]
  when 'publish'
    # Read JSON from stdin or file
    if ARGV[1] && File.exist?(ARGV[1])
      article_data = JSON.parse(File.read(ARGV[1]))
    else
      article_data = JSON.parse(STDIN.read)
    end

    result = publisher.publish_article(article_data)
    puts JSON.pretty_generate(result)

  when 'draft'
    # Read JSON from stdin or file
    if ARGV[1] && File.exist?(ARGV[1])
      article_data = JSON.parse(File.read(ARGV[1]))
    else
      article_data = JSON.parse(STDIN.read)
    end

    result = publisher.save_draft(article_data)
    puts JSON.pretty_generate(result)

  when 'list'
    limit = (ARGV[1] || 10).to_i
    articles = publisher.list_recent_articles(limit)
    puts JSON.pretty_generate(articles)

  when 'stats'
    stats = publisher.get_stats
    puts JSON.pretty_generate(stats)

  else
    puts "Usage:"
    puts "  ruby article_publisher.rb publish [file.json]  # Publish article from JSON"
    puts "  ruby article_publisher.rb draft [file.json]    # Save draft from JSON"
    puts "  ruby article_publisher.rb list [limit]         # List recent articles"
    puts "  ruby article_publisher.rb stats                # Show site statistics"
    puts ""
    puts "JSON format for articles:"
    puts '  {"title": "Article Title", "author": "Author Name", "description": "Description", "tags": "tag1, tag2", "content": "Article content..."}'
  end
end
