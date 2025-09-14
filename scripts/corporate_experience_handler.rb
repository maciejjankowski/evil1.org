#!/usr/bin/env ruby
# Corporate Experience Submission Handler
# Processes anonymous corporate experience submissions

require 'yaml'
require 'json'
require 'digest'
require 'fileutils'
require 'date'

class CorporateExperienceHandler
  def initialize
    @data_dir = '_data'
    @experiences_file = File.join(@data_dir, 'corporate_experiences.yml')
    @patterns_file = File.join(@data_dir, 'corporate_patterns.yml')
    @companies_file = File.join(@data_dir, 'companies.yml')
    ensure_directories_exist
  end

  def process_submission(submission_data)
    puts "📥 Processing corporate experience submission..."

    # Validate submission
    validation_result = validate_submission(submission_data)
    return validation_result unless validation_result[:success]

    # Anonymize and process
    experience = anonymize_experience(submission_data)
    
    # Find similar patterns and companies
    experience = find_similar_patterns(experience)
    experience = find_similar_companies(experience)
    
    # Store the experience
    store_experience(experience)
    
    # Update pattern data
    update_patterns(experience)
    
    puts "✅ Experience processed and stored anonymously"
    
    {
      success: true,
      message: "Your experience has been submitted anonymously and will help expose similar corporate practices.",
      experience_id: experience['id']
    }
  end

  def get_recent_experiences(limit = 10)
    experiences = load_experiences
    experiences.sort_by { |exp| exp['submitted_at'] }.reverse.first(limit)
  end

  def get_patterns_by_type(experience_type)
    patterns = load_patterns
    patterns[experience_type] || []
  end

  def get_companies_with_pattern(pattern)
    companies = []
    experiences = load_experiences
    
    experiences.each do |exp|
      if exp['patterns'] && exp['patterns'].include?(pattern)
        companies.concat(exp['similar_companies'] || [])
      end
    end
    
    companies.uniq
  end

  private

  def ensure_directories_exist
    FileUtils.mkdir_p(@data_dir)
  end

  def validate_submission(data)
    required_fields = %w[industry company_size role_level experience_type experience_description timeframe]
    
    missing_fields = required_fields.select { |field| data[field].nil? || data[field].strip.empty? }
    
    if missing_fields.any?
      return {
        success: false,
        error: "Missing required fields: #{missing_fields.join(', ')}"
      }
    end

    if data['experience_description'].length < 50
      return {
        success: false,
        error: "Experience description must be at least 50 characters"
      }
    end

    { success: true }
  end

  def anonymize_experience(data)
    # Generate anonymous ID
    experience_id = generate_experience_id(data)
    
    # Create anonymized summary
    summary = anonymize_description(data['experience_description'])
    
    # Extract patterns from the experience
    patterns = extract_patterns(data)
    
    {
      'id' => experience_id,
      'industry' => data['industry'],
      'company_size' => data['company_size'],
      'role_level' => data['role_level'],
      'experience_type' => data['experience_type'],
      'timeframe' => data['timeframe'],
      'anonymized_summary' => summary,
      'patterns' => patterns,
      'ongoing' => data['ongoing'] == 'true',
      'widespread' => data['widespread'] == 'true',
      'documented' => data['documented'] == 'true',
      'submitted_at' => Date.today.to_s
    }
  end

  def generate_experience_id(data)
    # Create a hash based on content but not identifying info
    content_hash = Digest::SHA256.hexdigest(
      "#{data['industry']}#{data['experience_type']}#{data['experience_description']}#{Time.now.to_i}"
    )
    "exp#{content_hash[0..5]}"
  end

  def anonymize_description(description)
    # Remove potentially identifying information
    anonymized = description.dup
    
    # Remove specific company names (basic approach)
    company_patterns = load_companies.keys
    company_patterns.each do |company|
      anonymized.gsub!(/\b#{Regexp.escape(company)}\b/i, '[Company]')
    end
    
    # Remove specific location names
    anonymized.gsub!(/\b\w+, [A-Z]{2}\b/, '[City, State]')
    anonymized.gsub!(/\b\d{5}\b/, '[ZIP]')
    
    # Remove names (simple pattern)
    anonymized.gsub!(/\b[A-Z][a-z]+ [A-Z][a-z]+\b/, '[Name]')
    
    # Remove email addresses
    anonymized.gsub!(/\S+@\S+\.\S+/, '[email]')
    
    # Remove phone numbers
    anonymized.gsub!(/\b\d{3}[-.]?\d{3}[-.]?\d{4}\b/, '[phone]')
    
    # Limit length and clean up
    anonymized = anonymized[0..500] if anonymized.length > 500
    anonymized.strip
  end

  def extract_patterns(data)
    patterns = []
    description = data['experience_description'].downcase
    impact = (data['impact'] || '').downcase
    response = (data['company_response'] || '').downcase
    
    all_text = "#{description} #{impact} #{response}"
    
    # Define pattern keywords
    pattern_keywords = {
      'Retaliation against complaints' => ['retaliat', 'fired for', 'punish', 'demot', 'blacklist'],
      'Excessive overtime without compensation' => ['overtime', 'unpaid', '80 hour', 'work week', 'no pay'],
      'Discrimination in hiring/promotion' => ['discriminat', 'bias', 'unfair promot', 'glass ceiling'],
      'Unsafe working conditions' => ['unsafe', 'danger', 'injury', 'health risk', 'accident'],
      'Wage theft' => ['wage theft', 'unpaid', 'overtime', 'minimum wage', 'stolen pay'],
      'Union busting activities' => ['union', 'organiz', 'strike', 'collective', 'labor right'],
      'Environmental violations' => ['pollut', 'toxic', 'environment', 'contaminat', 'illegal dump'],
      'Data privacy violations' => ['privacy', 'data breach', 'personal info', 'unauthorized access'],
      'Customer fraud' => ['fraud', 'scam', 'mislead', 'false advertis', 'deceptive'],
      'Financial misconduct' => ['embezzl', 'financial fraud', 'money lauder', 'tax evasion']
    }
    
    pattern_keywords.each do |pattern, keywords|
      if keywords.any? { |keyword| all_text.include?(keyword) }
        patterns << pattern
      end
    end
    
    patterns
  end

  def find_similar_patterns(experience)
    existing_experiences = load_experiences
    similar_patterns = []
    
    existing_experiences.each do |existing|
      if existing['experience_type'] == experience['experience_type'] ||
         existing['industry'] == experience['industry']
        similar_patterns.concat(existing['patterns'] || [])
      end
    end
    
    experience['related_patterns'] = similar_patterns.uniq
    experience
  end

  def find_similar_companies(experience)
    # Load existing company data
    companies_data = load_companies
    similar_companies = []
    
    # Look for companies with similar patterns in our data
    experience['patterns'].each do |pattern|
      companies_data.each do |company_name, company_data|
        if company_has_pattern(company_data, pattern, experience['experience_type'])
          similar_companies << company_name.to_s.split('_').map(&:capitalize).join(' ')
        end
      end
    end
    
    # Add some industry-specific known offenders
    industry_offenders = get_industry_offenders(experience['industry'], experience['experience_type'])
    similar_companies.concat(industry_offenders)
    
    experience['similar_companies'] = similar_companies.uniq.first(5)
    experience
  end

  def company_has_pattern(company_data, pattern, experience_type)
    return false unless company_data.is_a?(Hash)
    
    # Check crimes section
    if company_data['crimes']
      company_data['crimes'].each do |crime|
        return true if crime['title'].downcase.include?(pattern.downcase.split(' ').first) ||
                      crime['description'].downcase.include?(pattern.downcase.split(' ').first)
      end
    end
    
    # Check workers section for labor-related patterns
    if company_data['workers'] && pattern.include?('wage') || pattern.include?('union') || pattern.include?('overtime')
      return true
    end
    
    false
  end

  def get_industry_offenders(industry, experience_type)
    offenders = {
      'technology' => ['Google', 'Meta', 'Amazon', 'Apple', 'Microsoft'],
      'finance' => ['Goldman Sachs', 'JPMorgan Chase', 'Wells Fargo', 'Bank of America'],
      'retail' => ['Walmart', 'Amazon', 'Target', 'Kroger'],
      'pharmaceuticals' => ['Pfizer', 'Johnson & Johnson', 'Purdue Pharma'],
      'energy' => ['ExxonMobil', 'Chevron', 'BP', 'Shell'],
      'healthcare' => ['UnitedHealth', 'Anthem', 'Aetna'],
      'manufacturing' => ['General Electric', 'Boeing', '3M']
    }
    
    offenders[industry] || []
  end

  def store_experience(experience)
    experiences = load_experiences
    experiences << experience
    
    File.write(@experiences_file, experiences.to_yaml)
  end

  def update_patterns(experience)
    patterns = load_patterns
    experience_type = experience['experience_type']
    
    patterns[experience_type] ||= []
    patterns[experience_type].concat(experience['patterns'])
    patterns[experience_type].uniq!
    
    File.write(@patterns_file, patterns.to_yaml)
  end

  def load_experiences
    return [] unless File.exist?(@experiences_file)
    YAML.load_file(@experiences_file) || []
  rescue
    []
  end

  def load_patterns
    return {} unless File.exist?(@patterns_file)
    YAML.load_file(@patterns_file) || {}
  rescue
    {}
  end

  def load_companies
    return {} unless File.exist?(@companies_file)
    YAML.load_file(@companies_file) || {}
  rescue
    {}
  end
end

# CLI interface
if __FILE__ == $0
  handler = CorporateExperienceHandler.new

  case ARGV[0]
  when 'process'
    # Read JSON from stdin or file
    if ARGV[1] && File.exist?(ARGV[1])
      submission_data = JSON.parse(File.read(ARGV[1]))
    else
      submission_data = JSON.parse(STDIN.read)
    end

    result = handler.process_submission(submission_data)
    puts JSON.pretty_generate(result)

  when 'recent'
    limit = (ARGV[1] || 10).to_i
    experiences = handler.get_recent_experiences(limit)
    puts JSON.pretty_generate(experiences)

  when 'patterns'
    experience_type = ARGV[1]
    patterns = handler.get_patterns_by_type(experience_type)
    puts JSON.pretty_generate(patterns)

  else
    puts "Usage:"
    puts "  ruby corporate_experience_handler.rb process [file.json]  # Process submission"
    puts "  ruby corporate_experience_handler.rb recent [limit]       # List recent experiences"
    puts "  ruby corporate_experience_handler.rb patterns [type]      # Get patterns by type"
    puts ""
    puts "JSON format for submissions:"
    puts '  {"industry": "technology", "experience_type": "discrimination", "experience_description": "...", ...}'
  end
end