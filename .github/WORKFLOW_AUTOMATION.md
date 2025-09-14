# Workflow Automation Configuration
# This file provides guidance for reducing manual approval requirements

## Repository Settings Recommendations

### 1. Actions Permissions
To reduce manual approvals for GitHub Actions:

**Settings > Actions > General:**
- ✅ Allow all actions and reusable workflows
- OR ✅ Allow actions created by GitHub + Allow actions by verified creators
- ✅ Allow GitHub Actions to create and approve pull requests

### 2. Branch Protection (if needed)
**Settings > Branches > Branch protection rules:**
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- ❌ Require pull request reviews before merging (for automated content)
- ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Allow force pushes (for automated workflows)
- ✅ Allow deletions (for cleanup)

### 3. Auto-merge Configuration
**For automated content publishing:**
```yaml
# Add to pull request templates or workflows
auto_merge:
  enable: true
  merge_method: "squash"  # or "merge" or "rebase"
  conditions:
    - status_checks_pass: true
    - created_by: "github-actions[bot]"
    - labels_include: ["automated", "content"]
```

### 4. Environment Protection Rules
**For production environments (optional):**
- ✅ Required reviewers: 0 (for trusted automated workflows)
- ✅ Wait timer: 0 minutes (for immediate deployment)
- ✅ Allow administrators to bypass configured protection rules

### 5. Dependabot Configuration
**Settings > Security & analysis:**
- ✅ Enable Dependabot alerts
- ✅ Enable Dependabot security updates
- ✅ Enable Dependabot version updates

## Automated Workflow Features

### Content Publishing
- **Schedule**: Daily at 9 AM UTC
- **Trigger**: Manual dispatch available
- **Auto-commit**: Publishes scheduled content automatically
- **Validation**: Builds Jekyll site before publishing

### Visual Testing
- **Triggers**: Push to main, PR to main, manual dispatch
- **Caching**: Node.js and Ruby dependencies cached
- **Artifacts**: Test reports stored for 30 days

### Backlog Management
- **Triggers**: Push to main, manual dispatch
- **Auto-commit**: Updates consolidated backlog
- **Validation**: Jekyll build verification

## Security Considerations

### Trusted Automation
- All workflows use official GitHub Actions
- No third-party actions with elevated permissions
- Bot commits clearly identified
- Content validation before publishing

### Manual Override
- Manual dispatch available for all workflows
- Force publish option for urgent content
- Ability to disable automation via repository settings

## Usage Instructions

### For Repository Owners
1. Review and apply repository settings above
2. Test workflows with manual dispatch
3. Monitor automated content publishing
4. Adjust schedule as needed

### For Content Creators
1. Add content to `_data/schedule.yml`
2. Use format: date, content_type, file, publish: false, title
3. Content auto-publishes on scheduled date
4. Manual publish available via workflow dispatch

### For Developers
1. All workflows include manual triggers
2. Build validation ensures no broken deployments
3. Artifact retention for debugging
4. Clear commit messages for tracking changes