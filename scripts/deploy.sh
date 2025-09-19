#!/bin/bash
# ===========================================
# EVIL1.ORG DEPLOYMENT SCRIPT
# Secure deployment to production server
# ===========================================

set -e  # Exit on any error

#!/bin/bash
# ===========================================
# EVIL1.ORG DEPLOYMENT SCRIPT
# Secure deployment to production server
# ===========================================

set -e  # Exit on any error

# Load configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CONFIG_FILE="$PROJECT_ROOT/configs/deploy.conf"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Warning: Configuration file not found at $CONFIG_FILE"
    echo "Using default settings..."
fi

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [INFO] $1" >> "$PROJECT_ROOT/$DEPLOYMENT_LOG"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [SUCCESS] $1" >> "$PROJECT_ROOT/$DEPLOYMENT_LOG"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [WARNING] $1" >> "$PROJECT_ROOT/$DEPLOYMENT_LOG"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [ERROR] $1" >> "$PROJECT_ROOT/$DEPLOYMENT_LOG"
}

# Function to check if SSH connection works
check_ssh_connection() {
    log_info "Checking SSH connection to $REMOTE_HOST..."
    if ssh -o ConnectTimeout=10 -o BatchMode=yes "$REMOTE_USER@$REMOTE_HOST" "echo 'SSH connection successful'" >/dev/null 2>&1; then
        log_success "SSH connection established"
        return 0
    else
        log_error "SSH connection failed. Please check your SSH key or credentials."
        log_info "Make sure you have SSH access to $REMOTE_USER@$REMOTE_HOST"
        log_info "You may need to run: ssh-copy-id $REMOTE_USER@$REMOTE_HOST"
        return 1
    fi
}

# Function to build the site
build_site() {
    log_info "Building Jekyll site..."

    # Set the Gemfile path
    export BUNDLE_GEMFILE="$(pwd)/configs/Gemfile"

    # Build the site
    if bundle exec jekyll build; then
        log_success "Site built successfully"
        return 0
    else
        log_error "Site build failed"
        return 1
    fi
}

# Function to deploy via rsync over SSH
deploy_via_rsync() {
    log_info "Starting deployment via rsync over SSH..."

    # Count files for reporting
    FILE_COUNT=$(find "$LOCAL_BUILD_DIR" -type f | wc -l)
    DIR_COUNT=$(find "$LOCAL_BUILD_DIR" -type d | wc -l)
    TOTAL_SIZE=$(du -sh "$LOCAL_BUILD_DIR" | cut -f1)

    log_info "Deploying $FILE_COUNT files ($DIR_COUNT directories, $TOTAL_SIZE)..."

    # Create backup on remote server
    log_info "Creating backup on remote server..."
    ssh "$REMOTE_USER@$REMOTE_HOST" "cd '$REMOTE_PATH' && mkdir -p ../backup && cp -r . ../backup/$(date +%Y%m%d-%H%M%S)-backup/" || {
        log_warning "Could not create backup on remote server (continuing anyway)"
    }

    # Upload files using rsync over SSH
    log_info "Uploading files to $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

    # Build rsync command with options
    RSYNC_CMD="rsync"
    for option in "${RSYNC_OPTIONS[@]}"; do
        RSYNC_CMD="$RSYNC_CMD $option"
    done
    RSYNC_CMD="$RSYNC_CMD -e \"ssh -o ConnectTimeout=$SSH_TIMEOUT -o ServerAliveInterval=60\""

    # Execute rsync
    if eval "$RSYNC_CMD \"$LOCAL_BUILD_DIR/\" \"$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH/\""; then

        log_success "Files uploaded successfully"

        # Set proper permissions on remote server
        log_info "Setting proper permissions on remote server..."
        ssh "$REMOTE_USER@$REMOTE_HOST" "
            find '$REMOTE_PATH' -type f -exec chmod 644 {} \;
            find '$REMOTE_PATH' -type d -exec chmod 755 {} \;
            echo 'Permissions set successfully'
        "

        return 0
    else
        log_error "File upload failed"
        return 1
    fi
}

# Function to verify deployment
verify_deployment() {
    log_info "Verifying deployment..."

    # Check if key files exist on remote server
    if ssh "$REMOTE_USER@$REMOTE_HOST" "
        test -f '$REMOTE_PATH/index.html' &&
        test -f '$REMOTE_PATH/assets/css/main.css' &&
        test -d '$REMOTE_PATH/assets'
    "; then
        log_success "Deployment verified - key files found on remote server"

        # Get file count on remote server
        REMOTE_FILE_COUNT=$(ssh "$REMOTE_USER@$REMOTE_HOST" "find '$REMOTE_PATH' -type f | wc -l")
        REMOTE_SIZE=$(ssh "$REMOTE_USER@$REMOTE_HOST" "du -sh '$REMOTE_PATH' | cut -f1")

        log_info "Remote server stats: $REMOTE_FILE_COUNT files, $REMOTE_SIZE"

        return 0
    else
        log_error "Deployment verification failed - key files not found"
        return 1
    fi
}

# Function to show deployment summary
show_summary() {
    echo
    echo "=========================================="
    echo "DEPLOYMENT SUMMARY"
    echo "=========================================="
    echo "Server: $REMOTE_HOST"
    echo "User: $REMOTE_USER"
    echo "Path: $REMOTE_PATH"
    echo "Local build: $LOCAL_BUILD_DIR"
    echo "Timestamp: $(date)"
    echo "=========================================="
}

# Function to rollback if needed
rollback() {
    log_warning "Starting rollback procedure..."

    # Find the latest backup
    LATEST_BACKUP=$(ssh "$REMOTE_USER@$REMOTE_HOST" "ls -td ~/domains/evil1.org/backup/*/ | head -1")

    if [ -n "$LATEST_BACKUP" ]; then
        log_info "Rolling back to backup: $LATEST_BACKUP"
        ssh "$REMOTE_USER@$REMOTE_HOST" "
            cd '$REMOTE_PATH'
            rm -rf *
            cp -r $LATEST_BACKUP* .
            echo 'Rollback completed'
        "
        log_success "Rollback completed successfully"
    else
        log_error "No backup found for rollback"
    fi
}

# Main deployment function
main() {
    echo "=========================================="
    echo "EVIL1.ORG DEPLOYMENT SCRIPT"
    echo "=========================================="
    echo "Target: $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"
    echo "=========================================="

    # Pre-deployment checks
    if ! check_ssh_connection; then
        exit 1
    fi

    # Build the site
    if ! build_site; then
        exit 1
    fi

    # Deploy
    if ! deploy_via_rsync; then
        log_error "Deployment failed. Would you like to rollback? (y/N)"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            rollback
        fi
        exit 1
    fi

    # Verify
    if ! verify_deployment; then
        log_error "Deployment verification failed. Would you like to rollback? (y/N)"
        read -r response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
            rollback
        fi
        exit 1
    fi

    # Success
    show_summary
    log_success "🎉 Deployment completed successfully!"
    log_info "Your site is now live at: https://evil1.org"
    log_info "Don't forget to clear any CDN cache if you're using one."
}

# Handle command line arguments
case "${1:-}" in
    "--dry-run")
        log_info "DRY RUN MODE - Testing build and connection without uploading"
        check_ssh_connection
        build_site
        log_success "Dry run completed successfully"
        ;;
    "--rollback")
        log_info "ROLLBACK MODE - Rolling back to previous deployment"
        if check_ssh_connection; then
            rollback
        fi
        ;;
    "--verify")
        log_info "VERIFY MODE - Checking current deployment status"
        if check_ssh_connection; then
            verify_deployment
        fi
        ;;
    "--help"|"-h")
        echo "Usage: $0 [OPTIONS]"
        echo ""
        echo "Options:"
        echo "  --dry-run     Test build and connection without uploading"
        echo "  --rollback    Rollback to previous deployment"
        echo "  --verify      Check current deployment status"
        echo "  --help, -h    Show this help message"
        echo ""
        echo "Environment Variables:"
        echo "  SSH_KEY_PATH    Path to SSH private key (optional)"
        echo "  REMOTE_HOST     Remote server hostname (default: s3.mydevil.net)"
        echo "  REMOTE_USER     Remote username (default: evil1)"
        echo "  REMOTE_PATH     Remote path (default: ~/domains/evil1.org/public_html)"
        echo ""
        echo "Examples:"
        echo "  $0              # Full deployment"
        echo "  $0 --dry-run    # Test without uploading"
        echo "  $0 --verify     # Check deployment status"
        echo "  $0 --rollback   # Rollback to previous version"
        ;;
    *)
        main
        ;;
esac
