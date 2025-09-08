# Content Management Interface

## Overview
The evil1.org Content Management Interface provides a user-friendly web interface for creating and managing articles without directly editing markdown files.

## Features

### Article Creation
- **Web-based Form**: Easy-to-use form interface for creating articles
- **Real-time Preview**: See how your article will look before publishing
- **Draft Saving**: Save work-in-progress as drafts in browser storage
- **Auto-generated Metadata**: Automatic reading time and SEO optimization

### Publishing System
- **One-click Publishing**: Publish articles directly to the site
- **Automatic File Generation**: Creates properly formatted markdown files
- **Metadata Management**: Handles tags, categories, and front matter
- **URL Generation**: Automatic SEO-friendly URL creation

### Content Organization
- **Category Support**: Organize articles by predefined categories
- **Tag Management**: Add relevant tags for better discoverability
- **Author Attribution**: Track article authors and contributors
- **Featured Articles**: Mark important articles for special display

## Usage

### Accessing the Interface
1. Navigate to `/admin/` on your evil1.org site
2. The interface will load with a clean, professional design

### Creating an Article
1. **Fill Basic Information**:
   - Title (required)
   - Author (defaults to "Editorial Team")
   - Description (required, used for SEO)
   - Tags (comma-separated, optional)

2. **Select Category**:
   - Choose from predefined categories or leave blank
   - Categories help organize content and improve navigation

3. **Write Content**:
   - Use markdown formatting in the content area
   - Support for headers, lists, links, and formatting
   - No HTML knowledge required

4. **Preview and Publish**:
   - Click "Preview" to see how the article will look
   - Click "Save Draft" to store work-in-progress
   - Click "Publish Article" to make it live

### Draft Management
- Drafts are saved in browser localStorage
- Automatically restored when you return to the interface
- Survives browser refreshes and sessions

## Technical Implementation

### Files Created
- `/admin.md` - Main interface page
- `/assets/css/admin.css` - Styling for the interface
- `/scripts/article_publisher.rb` - Backend publishing script

### Publishing Process
1. Form data is collected and validated
2. Markdown file is generated with proper front matter
3. File is saved to `_articles/` directory
4. Metadata is updated in relevant data files
5. Success confirmation is displayed

### Data Structure
Articles are created with the following front matter:
```yaml
---
layout: article
title: "Article Title"
author: "Author Name"
date: "2025-09-08"
description: "Article description for SEO"
tags: ["tag1", "tag2"]
categories: ["category"]
published: true
---
```

## Security Considerations

### Access Control
- Currently accessible to anyone who knows the URL
- Consider adding authentication for production use
- Admin access should be restricted to authorized users

### Content Validation
- Client-side validation for required fields
- Server-side validation in the publishing script
- HTML sanitization to prevent XSS attacks

## Future Enhancements

### Planned Features
- **User Authentication**: Login system for content creators
- **Bulk Operations**: Import/export multiple articles
- **Image Upload**: Direct image uploading and management
- **Version Control**: Track article revisions
- **Collaborative Editing**: Multiple authors working on same article
- **SEO Analysis**: Built-in SEO scoring and suggestions

### Integration Possibilities
- **Git Integration**: Automatic commits for version control
- **API Endpoints**: REST API for external integrations
- **Webhook Support**: Notifications for publishing events
- **Analytics Integration**: Track article performance

## Troubleshooting

### Common Issues
1. **Preview Not Working**: Check browser console for JavaScript errors
2. **Publishing Fails**: Ensure Ruby script has proper permissions
3. **Styling Issues**: Clear browser cache or check CSS loading

### Getting Help
- Check browser developer tools for errors
- Verify file permissions on the server
- Test with the provided sample article JSON

## Sample Usage

```bash
# Test the publishing system
echo '{"title": "Sample Article", "content": "# Hello World"}' | ruby scripts/article_publisher.rb publish

# Check site statistics
ruby scripts/article_publisher.rb stats

# List recent articles
ruby scripts/article_publisher.rb list 5
```

This interface significantly improves the content creation workflow while maintaining the technical benefits of Jekyll's static site generation.
