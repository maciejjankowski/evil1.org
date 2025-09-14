#!/usr/bin/env ruby
# Simple Sinatra API for corporate experience submissions
# This would typically run on a separate server, but for demo purposes
# we'll create a simple handler that saves to files

require 'sinatra'
require 'json'
require_relative './corporate_experience_handler'

# Enable CORS for development
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
end

# Handle preflight requests
options '*' do
  response.headers["Allow"] = "POST, GET, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end

# Initialize handler
configure do
  set :handler, CorporateExperienceHandler.new
end

# Submit corporate experience
post '/api/submit-experience' do
  content_type :json
  
  begin
    # Parse form data
    submission_data = {
      'company_name' => params[:company_name],
      'industry' => params[:industry],
      'company_size' => params[:company_size],
      'role_level' => params[:role_level],
      'experience_type' => params[:experience_type],
      'experience_description' => params[:experience_description],
      'impact' => params[:impact],
      'company_response' => params[:company_response],
      'timeframe' => params[:timeframe],
      'ongoing' => params[:ongoing],
      'widespread' => params[:widespread],
      'documented' => params[:documented]
    }
    
    # Process submission
    result = settings.handler.process_submission(submission_data)
    
    if result[:success]
      status 200
      {
        success: true,
        message: result[:message],
        html: "<div class='success'>✅ #{result[:message]}</div>"
      }.to_json
    else
      status 400
      {
        success: false,
        error: result[:error],
        html: "<div class='error'>❌ #{result[:error]}</div>"
      }.to_json
    end
    
  rescue JSON::ParserError => e
    status 400
    {
      success: false,
      error: "Invalid JSON format: #{e.message}",
      html: "<div class='error'>❌ Invalid data format</div>"
    }.to_json
    
  rescue => e
    status 500
    {
      success: false,
      error: "Server error: #{e.message}",
      html: "<div class='error'>❌ Server error occurred. Please try again.</div>"
    }.to_json
  end
end

# Get recent experiences (for the feed)
get '/api/recent-experiences' do
  content_type :json
  
  begin
    limit = (params[:limit] || 10).to_i
    experiences = settings.handler.get_recent_experiences(limit)
    
    {
      success: true,
      experiences: experiences
    }.to_json
    
  rescue => e
    status 500
    {
      success: false,
      error: "Error fetching experiences: #{e.message}"
    }.to_json
  end
end

# Get patterns for a specific experience type
get '/api/patterns/:type' do
  content_type :json
  
  begin
    patterns = settings.handler.get_patterns_by_type(params[:type])
    
    {
      success: true,
      patterns: patterns
    }.to_json
    
  rescue => e
    status 500
    {
      success: false,
      error: "Error fetching patterns: #{e.message}"
    }.to_json
  end
end

# Health check
get '/api/health' do
  content_type :json
  { status: 'OK', timestamp: Time.now.iso8601 }.to_json
end

# For static file serving in development
get '/' do
  redirect '/corporate-inbox/'
end