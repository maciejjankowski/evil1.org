---
layout: default
title: "Content Format Standards"
description: "Standards and guidelines for content formatting across the evil1.org site"
permalink: /content-format-standards/
---

# Content Format Standards

## Organization Files Format Standard

All organization files in `_organizations/` MUST use the following front matter format:

```yaml
---
layout: sig
sig_title: "Organization Name"
sig_desc: "Brief description of the organization's evil practices"
sig_topics:
  - Topic 1
  - Topic 2
  - Topic 3
  - Topic 4
  - Topic 5
---
```

### ❌ FORBIDDEN Format (Causes Display Issues)
```yaml
---
layout: organization
organization:
  name: "Organization Name"
  headline: "Description"
  location: "Location"
  principles:
    - title: "Title"
      body: "Body"
      impact: "Impact"
  policies:
    - title: "Title"
      body: "Body"
      impact: "Impact"
---
```

### Validation Rule
- **Layout**: Must be `sig` (not `organization`)
- **Title Field**: Must be `sig_title` (not `organization.name`)
- **Description Field**: Must be `sig_desc` (not `organization.headline`)
- **Topics Field**: Must be `sig_topics` array (not nested `principles`/`policies`)

### Why This Matters
- The organizations index page (`/organizations/`) expects the SIG format
- Mixed formats cause some organizations to display as empty cards
- Inconsistent front matter breaks the Jekyll collection rendering

### Quick Fix Script
Run this to check for format violations:
```bash
grep -l "layout: organization" _organizations/*.md
```

If any files are returned, they need to be converted to SIG format.
