#!/usr/bin/env ruby
# Sitemap Generator Script for evil1.org
# This script generates an optimized sitemap.xml file

require 'yaml'
require 'fileutils'
require 'date'

class SitemapGenerator
  def initialize(site_dir = '.')
    @site_dir = site_dir
    @sitemap_file = File.join(site_dir, 'sitemap.xml')
    @config_file = File.join(site_dir, '_config.yml')
  end

  def generate_sitemap
    puts "🗺️ Generating optimized sitemap..."

    site_config = load_site_config
    site_url = site_config['url'] || 'https://evil1.org'

    sitemap_content = build_sitemap_xml(site_url)

    File.write(@sitemap_file, sitemap_content)
    puts "✅ Sitemap generated successfully!"
    puts "📄 Sitemap saved to: #{@sitemap_file}"
    puts "📊 Total URLs in sitemap: #{count_urls(sitemap_content)}"
  end

  private

  def load_site_config
    if File.exist?(@config_file)
      YAML.load_file(@config_file) || {}
    else
      {}
    end
  rescue
    {}
  end

  def build_sitemap_xml(site_url)
    xml = <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
        http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
XML

    # Add static pages
    xml += generate_static_pages(site_url)

    # Add dynamic content
    xml += generate_dynamic_content(site_url)

    xml += "\n</urlset>"
    xml
  end

  def generate_static_pages(site_url)
    today = Date.today.strftime("%Y-%m-%d")

    pages = [
      { url: '/', priority: '1.0', changefreq: 'daily' },
      { url: '/about/', priority: '0.8', changefreq: 'monthly' },
      { url: '/articles/', priority: '0.9', changefreq: 'daily' },
      { url: '/categories/', priority: '0.7', changefreq: 'weekly' },
      { url: '/tags/', priority: '0.7', changefreq: 'weekly' },
      { url: '/activities/', priority: '0.8', changefreq: 'weekly' },
      { url: '/company/', priority: '0.8', changefreq: 'weekly' },
      { url: '/education/', priority: '0.8', changefreq: 'weekly' },
      { url: '/groups/', priority: '0.7', changefreq: 'weekly' },
      { url: '/halloffame/', priority: '0.8', changefreq: 'weekly' },
      { url: '/Institute/', priority: '0.7', changefreq: 'weekly' },
      { url: '/members/', priority: '0.7', changefreq: 'weekly' },
      { url: '/news/', priority: '0.8', changefreq: 'daily' },
      { url: '/organizations/', priority: '0.7', changefreq: 'weekly' },
      { url: '/profiles/', priority: '0.7', changefreq: 'weekly' },
      { url: '/stories/', priority: '0.7', changefreq: 'weekly' },
      { url: '/strategy/', priority: '0.6', changefreq: 'monthly' },
      { url: '/topics/', priority: '0.7', changefreq: 'weekly' },
      { url: '/trainings/', priority: '0.7', changefreq: 'weekly' },
      { url: '/unfiltered/', priority: '0.7', changefreq: 'weekly' }
    ]

    xml = ""
    pages.each do |page|
      xml += generate_url_entry(site_url + page[:url], today, page[:changefreq], page[:priority])
    end

    xml
  end

  def generate_dynamic_content(site_url)
    xml = ""

    # Articles
    Dir.glob(File.join(@site_dir, '_articles', '*.md')).each do |file|
      url = generate_article_url(file)
      date = extract_date_from_file(file)
      xml += generate_url_entry(site_url + url, date, 'monthly', '0.8')
    end

    # Posts
    Dir.glob(File.join(@site_dir, '_posts', '*.markdown')).each do |file|
      url = generate_post_url(file)
      date = extract_date_from_filename(file)
      xml += generate_url_entry(site_url + url, date, 'monthly', '0.7')
    end

    # Organizations
    Dir.glob(File.join(@site_dir, '_organizations', '*.md')).each do |file|
      url = generate_org_url(file)
      xml += generate_url_entry(site_url + url, Date.today.strftime("%Y-%m-%d"), 'monthly', '0.6')
    end

    # Profiles
    Dir.glob(File.join(@site_dir, '_profiles', '*.md')).each do |file|
      url = generate_profile_url(file)
      xml += generate_url_entry(site_url + url, Date.today.strftime("%Y-%m-%d"), 'monthly', '0.6')
    end

    # Company pages
    Dir.glob(File.join(@site_dir, 'company', '*.md')).each do |file|
      url = generate_company_url(file)
      xml += generate_url_entry(site_url + url, Date.today.strftime("%Y-%m-%d"), 'monthly', '0.7')
    end

    xml
  end

  def generate_url_entry(url, lastmod, changefreq, priority)
    <<-URL

  <url>
    <loc>#{url}</loc>
    <lastmod>#{lastmod}</lastmod>
    <changefreq>#{changefreq}</changefreq>
    <priority>#{priority}</priority>
  </url>
URL
  end

  def generate_article_url(file)
    filename = File.basename(file, '.md')
    "/articles/#{filename}/"
  end

  def generate_post_url(file)
    filename = File.basename(file, '.markdown')
    # Extract date from Jekyll post filename format: YYYY-MM-DD-title
    if filename =~ /^(\d{4}-\d{2}-\d{2})-(.+)$/
      "/#{$2}/"
    else
      "/#{filename}/"
    end
  end

  def generate_org_url(file)
    filename = File.basename(file, '.md')
    "/organizations/#{filename}/"
  end

  def generate_profile_url(file)
    filename = File.basename(file, '.md')
    "/profiles/#{filename}/"
  end

  def generate_company_url(file)
    filename = File.basename(file, '.md')
    "/company/#{filename}/"
  end

  def extract_date_from_file(file)
    content = File.read(file)
    if content =~ /^---\n(.*?\n)---/m
      front_matter = $1
      if front_matter =~ /date:\s*(.+)/
        date_str = $1.strip
        begin
          Date.parse(date_str).strftime("%Y-%m-%d")
        rescue
          Date.today.strftime("%Y-%m-%d")
        end
      else
        Date.today.strftime("%Y-%m-%d")
      end
    else
      Date.today.strftime("%Y-%m-%d")
    end
  end

  def extract_date_from_filename(file)
    filename = File.basename(file, '.markdown')
    if filename =~ /^(\d{4}-\d{2}-\d{2})/
      $1
    else
      Date.today.strftime("%Y-%m-%d")
    end
  end

  def count_urls(xml_content)
    xml_content.scan(/<url>/).size
  end
end

# Run the generator if this script is executed directly
if __FILE__ == $0
  generator = SitemapGenerator.new(ARGV[0] || '.')
  generator.generate_sitemap
end
