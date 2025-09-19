# EVIL1.ORG DEPLOYMENT GUIDE

## Overview
This deployment script securely publishes your Jekyll site to the production server using rsync over SSH.

## Server Configuration
- **Host**: s3.mydevil.net
- **User**: evil1
- **Path**: ~/domains/evil1.org/public_html
- **Method**: rsync over SSH

## Prerequisites

### 1. SSH Access Setup
You need SSH access to the server. Set up authentication:

```bash
# Generate SSH key (if you don't have one)
ssh-keygen -t ed25519 -C "your-email@example.com"

# Copy public key to server
ssh-copy-id evil1@s3.mydevil.net

# Test connection
ssh evil1@s3.mydevil.net "echo 'SSH connection successful'"
```

### 2. Dependencies
Ensure these tools are installed:
```bash
# macOS
brew install rsync openssh

# Ubuntu/Debian
sudo apt-get install rsync openssh-client

# Check versions
rsync --version
ssh -V
```

## Usage

### Basic Deployment
```bash
# Deploy to production
./scripts/deploy.sh

# Dry run (test without uploading)
./scripts/deploy.sh --dry-run

# Check deployment status
./scripts/deploy.sh --verify

# Rollback to previous version
./scripts/deploy.sh --rollback
```

### Configuration
Edit `configs/deploy.conf` to customize settings:

```bash
# Server settings
REMOTE_HOST="s3.mydevil.net"
REMOTE_USER="evil1"
REMOTE_PATH="~/domains/evil1.org/public_html"

# SSH settings
SSH_KEY_PATH="$HOME/.ssh/id_rsa"
SSH_PORT="22"
SSH_TIMEOUT="30"

# Deployment options
CREATE_BACKUP="true"
VERIFY_DEPLOYMENT="true"
SET_PERMISSIONS="true"
```

## Deployment Process

### 1. Pre-deployment Checks
- ✅ SSH connection test
- ✅ Local site build
- ✅ File integrity checks

### 2. Deployment Steps
- 📦 Build Jekyll site
- 💾 Create remote backup
- 🚀 Upload files via rsync
- 🔧 Set proper permissions
- ✅ Verify deployment

### 3. Post-deployment
- 📊 Generate deployment report
- 🧹 Cleanup old backups
- 📝 Log deployment details

## Features

### 🔒 Security
- SSH key authentication only
- No passwords in scripts
- Secure file transfer with rsync

### 📊 Monitoring
- Real-time progress reporting
- File count and size tracking
- Deployment verification
- Comprehensive logging

### 🛡️ Reliability
- Automatic backups before deployment
- Rollback capability
- Error handling and recovery
- Connection timeout handling

### ⚡ Performance
- Incremental uploads with rsync
- Compression during transfer
- Parallel file operations
- Optimized for large sites

## Troubleshooting

### SSH Connection Issues
```bash
# Test SSH connection
ssh -v evil1@s3.mydevil.net

# Check SSH key
ssh-add -l

# Add SSH key to agent
ssh-add ~/.ssh/id_rsa
```

### Build Issues
```bash
# Test local build
BUNDLE_GEMFILE=configs/Gemfile bundle exec jekyll build

# Check for errors
BUNDLE_GEMFILE=configs/Gemfile bundle exec jekyll build --trace
```

### Permission Issues
```bash
# Check remote permissions
ssh evil1@s3.mydevil.net "ls -la ~/domains/evil1.org/"

# Fix permissions if needed
ssh evil1@s3.mydevil.net "chmod 755 ~/domains/evil1.org/public_html"
```

## Logs and Monitoring

### Deployment Logs
```bash
# View deployment logs
tail -f logs/deployment.log

# Search for errors
grep "ERROR" logs/deployment.log

# View recent deployments
grep "SUCCESS" logs/deployment.log | tail -10
```

### Remote Server Logs
```bash
# Check web server logs
ssh evil1@s3.mydevil.net "tail -f /var/log/apache2/evil1.org_error.log"

# Check file permissions
ssh evil1@s3.mydevil.net "find ~/domains/evil1.org/public_html -type f -exec ls -l {} \;"
```

## Backup and Recovery

### Automatic Backups
The script automatically creates backups on the remote server:
```
~/domains/evil1.org/backup/YYYYMMDD-HHMMSS-backup/
```

### Manual Backup
```bash
# Create manual backup
ssh evil1@s3.mydevil.net "cd ~/domains/evil1.org/public_html && cp -r . ../backup/manual-$(date +%Y%m%d-%H%M%S)/"

# List backups
ssh evil1@s3.mydevil.net "ls -la ~/domains/evil1.org/backup/"
```

### Rollback
```bash
# Automatic rollback
./scripts/deploy.sh --rollback

# Manual rollback
ssh evil1@s3.mydevil.net "cd ~/domains/evil1.org && rm -rf public_html/* && cp -r backup/LATEST_BACKUP/* public_html/"
```

## Performance Optimization

### Rsync Options
The script uses optimized rsync options:
- `--archive`: Preserve permissions, timestamps, etc.
- `--compress`: Compress during transfer
- `--delete`: Remove files not in source
- `--exclude`: Skip unnecessary files

### Large Site Handling
For large sites, the script:
- Uses incremental transfers
- Shows progress indicators
- Handles connection timeouts
- Maintains file integrity

## Security Best Practices

### SSH Configuration
```bash
# Use strong SSH key
ssh-keygen -t ed25519 -a 100

# Disable password authentication
# Edit /etc/ssh/sshd_config on server
# PasswordAuthentication no

# Use SSH config file
echo "Host s3.mydevil.net
    User evil1
    IdentityFile ~/.ssh/id_rsa
    Port 22" >> ~/.ssh/config
```

### File Permissions
The script sets secure permissions:
- Files: 644 (rw-r--r--)
- Directories: 755 (rwxr-xr-x)
- Owner: evil1

## Monitoring and Alerts

### Health Checks
```bash
# Test site availability
curl -I https://evil1.org

# Check file integrity
ssh evil1@s3.mydevil.net "find ~/domains/evil1.org/public_html -name '*.html' | head -5 | xargs wc -l"
```

### Automated Monitoring
Consider setting up monitoring:
- Uptime monitoring (UptimeRobot, Pingdom)
- SSL certificate monitoring
- Performance monitoring (Google PageSpeed)
- Error log monitoring

## Advanced Usage

### Custom Deployment
```bash
# Deploy specific environment
JEKYLL_ENV=staging ./scripts/deploy.sh

# Deploy with custom config
REMOTE_HOST="staging.mydevil.net" ./scripts/deploy.sh
```

### CI/CD Integration
```yaml
# GitHub Actions example
- name: Deploy to Production
  run: |
    chmod +x scripts/deploy.sh
    ./scripts/deploy.sh
  env:
    SSH_PRIVATE_KEY: ${{ secrets.SSH_PRIVATE_KEY }}
```

## Support

### Common Issues
1. **SSH connection fails**: Check SSH key and server access
2. **Build fails**: Run local build test first
3. **Permissions error**: Check remote directory permissions
4. **Timeout**: Increase SSH_TIMEOUT in config

### Getting Help
1. Check deployment logs: `logs/deployment.log`
2. Test SSH connection manually
3. Verify local build works
4. Check remote server logs

---

**Happy Deploying! 🚀**