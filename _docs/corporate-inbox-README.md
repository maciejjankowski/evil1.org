# Corporate Experience Inbox

## Overview
The Corporate Experience Inbox is an anonymous submission system that allows employees to share their corporate experiences without revealing their identity. The system automatically anonymizes submissions and identifies similar practices across different companies.

## Features

### Anonymous Submission Form
- Complete anonymity - no email, IP tracking, or identifying information collected
- Comprehensive form fields for detailed experience reporting:
  - Industry and company size classification
  - Role level and experience type categorization
  - Detailed experience description with impact and company response
  - Timeframe and additional context options

### Automatic Processing
- Pattern extraction from submissions using keyword matching
- Anonymization of potentially identifying information
- Company matching based on existing data and industry patterns
- Storage in structured YAML format for easy management

### Display System
- Recent experiences feed showing anonymized stories
- Similar company identification and display
- Pattern categorization and cross-referencing
- Clean, responsive UI with clear privacy messaging

## Implementation

### Files Created
- `/corporate-inbox.md` - Main page content
- `/_layouts/corporate_inbox.html` - Page layout and form
- `/assets/css/corporate-inbox.css` - Styling
- `/_data/corporate_experiences.yml` - Storage for submissions
- `/_data/corporate_patterns.yml` - Pattern categorization data
- `/scripts/corporate_experience_handler.rb` - Backend processing
- `/scripts/api_server.rb` - Simple API endpoint (optional)

### Data Flow
1. User submits experience via form
2. Script anonymizes content and extracts patterns
3. System matches with similar companies and practices
4. Anonymized experience is stored and displayed
5. Patterns are updated for future matching

### Privacy & Security
- No personally identifiable information collected
- Content automatically anonymized before storage
- No IP logging or tracking
- Clear privacy notices and consent

## Usage

### Submitting an Experience
1. Navigate to `/corporate-inbox/`
2. Fill out the anonymous form
3. System processes and anonymizes submission
4. Experience appears in public feed (anonymized)

### Backend Processing
```bash
# Process a submission
ruby scripts/corporate_experience_handler.rb process submission.json

# View recent experiences
ruby scripts/corporate_experience_handler.rb recent 10

# Get patterns by type
ruby scripts/corporate_experience_handler.rb patterns discrimination
```

## Technical Details

### Backend Dependencies
- Ruby with YAML, JSON, Digest libraries
- Jekyll for static site generation
- Optional: Sinatra for API endpoints

### Pattern Matching
The system uses keyword-based pattern extraction to identify:
- Discrimination and harassment patterns
- Retaliation and whistleblowing issues
- Wage theft and labor violations
- Safety and environmental concerns
- Ethics and fraud patterns

### Company Matching
Matches companies based on:
- Existing company data in `_data/companies.yml`
- Industry-specific known offenders
- Pattern similarity across submissions
- Manual curation and validation

## Future Enhancements
- AI-powered pattern recognition
- More sophisticated anonymization
- Integration with legal resources
- Automated report generation
- Enhanced search and filtering
- Company response tracking