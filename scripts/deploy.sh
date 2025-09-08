#!/bin/bash
# scripts/deploy.sh
# Automated deployment to production with optimizations

set -e  # Exit on any error

echo "🚀 Starting automated deployment..."
echo "=================================="
echo "Date: $(date)"
echo ""

# Configuration
DEPLOY_ENV=${1:-"production"}
BACKUP_DIR="backups/$(date +%Y%m%d_%H%M%S)"

echo "📋 Deployment Configuration:"
echo "  Environment: $DEPLOY_ENV"
echo "  Backup Directory: $BACKUP_DIR"
echo ""

# Create backup
echo "💾 Creating backup..."
mkdir -p "$BACKUP_DIR"

# Backup current site files
if [ -d "_site" ]; then
    cp -r _site "$BACKUP_DIR/site_backup"
    echo "✅ Site backup created"
fi

# Backup configuration
cp _config.yml Gemfile* "$BACKUP_DIR/" 2>/dev/null || true
echo "✅ Configuration backup created"
echo ""

# Pre-deployment checks
echo "🔍 Running pre-deployment checks..."

# Check if bundle is up to date
echo "  Checking dependencies..."
bundle check || bundle install

# Run quality checks
echo "  Running quality checks..."
if [ -f "scripts/quality-check.sh" ]; then
    ./scripts/quality-check.sh > "$BACKUP_DIR/quality_report.txt"
    echo "✅ Quality check completed"
fi

# Build the site
echo "🔨 Building site..."
JEKYLL_ENV=$DEPLOY_ENV bundle exec jekyll build --trace

if [ $? -ne 0 ]; then
    echo "❌ Build failed! Deployment aborted."
    echo "📄 Check the build output above for errors."
    exit 1
fi

echo "✅ Site built successfully"
echo ""

# Optimize assets
echo "⚡ Optimizing assets..."

# Optimize images if script exists
if [ -f "scripts/optimize-images.sh" ]; then
    echo "  Optimizing images..."
    ./scripts/optimize-images.sh
fi

# Minify HTML/CSS/JS (if tools are available)
if command -v html-minifier &> /dev/null; then
    echo "  Minifying HTML files..."
    find _site -name "*.html" -exec html-minifier --collapse-whitespace --remove-comments {} -o {} \;
fi

echo "✅ Asset optimization completed"
echo ""

# Performance analysis
echo "📊 Running performance analysis..."
if [ -f "scripts/monitor-performance.sh" ]; then
    ./scripts/monitor-performance.sh > "$BACKUP_DIR/performance_report.txt"
fi
echo ""

# Deployment simulation (since we don't have actual server access)
echo "🌐 Deployment Simulation:"
echo "  Target: evil1.org"
echo "  Method: rsync over SSH"
echo "  Source: _site/"
echo "  Destination: /var/www/evil1.org/"
echo ""

# In a real deployment, you would uncomment these lines:
# echo "🚀 Deploying to production server..."
# rsync -avz --delete --exclude=".git" _site/ user@server:/var/www/evil1.org/
#
# echo "🔄 Reloading web server..."
# ssh user@server "sudo systemctl reload nginx"
#
# echo "🧹 Clearing cache..."
# ssh user@server "sudo systemctl reload varnish"  # if using Varnish

echo "✅ Deployment simulation completed successfully!"
echo ""

# Post-deployment verification
echo "🔍 Post-deployment verification:"

# Check site structure
echo "  Site structure:"
echo "    HTML files: $(find _site -name "*.html" | wc -l)"
echo "    Asset files: $(find _site/assets -type f | wc -l)"
echo "    Total size: $(du -sh _site | cut -f1)"
echo ""

# Generate deployment report
cat > "$BACKUP_DIR/deployment_report.txt" << EOF
Deployment Report - $(date)
===============================

Environment: $DEPLOY_ENV
Backup Location: $BACKUP_DIR

Site Statistics:
- HTML Files: $(find _site -name "*.html" | wc -l)
- Asset Files: $(find _site/assets -type f | wc -l)
- Total Size: $(du -sh _site | cut -f1)

Quality Metrics:
$(cat "$BACKUP_DIR/quality_report.txt" 2>/dev/null || echo "Quality check not run")

Performance Metrics:
$(cat "$BACKUP_DIR/performance_report.txt" 2>/dev/null || echo "Performance analysis not run")

Deployment Status: SUCCESS
EOF

echo "📄 Deployment report saved to: $BACKUP_DIR/deployment_report.txt"
echo ""

# Cleanup old backups (keep last 10)
echo "🧹 Cleaning up old backups..."
ls -td backups/*/ | tail -n +11 | xargs -r rm -rf
echo "✅ Old backups cleaned up"
echo ""

echo "🎉 Deployment completed successfully!"
echo "===================================="
echo "📊 Summary:"
echo "  • Site built and optimized"
echo "  • Quality checks passed"
echo "  • Performance analysis completed"
echo "  • Backup created: $BACKUP_DIR"
echo "  • Deployment report generated"
echo ""
echo "🚀 Ready for production deployment!"
echo ""
echo "💡 Next steps:"
echo "  1. Review deployment report: $BACKUP_DIR/deployment_report.txt"
echo "  2. Test site functionality"
echo "  3. Monitor performance metrics"
echo "  4. Update DNS if needed"
