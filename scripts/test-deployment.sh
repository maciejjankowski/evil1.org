#!/bin/bash
# ===========================================
# EVIL1.ORG DEPLOYMENT TEST SCRIPT
# Test deployment setup without uploading
# ===========================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "=========================================="
echo "EVIL1.ORG DEPLOYMENT TEST"
echo "=========================================="

# Test 1: Check if deployment script exists and is executable
echo -e "${BLUE}Test 1:${NC} Checking deployment script..."
if [ -x "$SCRIPT_DIR/deploy.sh" ]; then
    echo -e "${GREEN}✅${NC} Deployment script exists and is executable"
else
    echo -e "${RED}❌${NC} Deployment script not found or not executable"
    exit 1
fi

# Test 2: Check configuration file
echo -e "${BLUE}Test 2:${NC} Checking configuration file..."
if [ -f "$PROJECT_ROOT/configs/deploy.conf" ]; then
    echo -e "${GREEN}✅${NC} Configuration file exists"
    source "$PROJECT_ROOT/configs/deploy.conf"
    echo "   Remote host: $REMOTE_HOST"
    echo "   Remote user: $REMOTE_USER"
    echo "   Remote path: $REMOTE_PATH"
else
    echo -e "${RED}❌${NC} Configuration file not found"
    exit 1
fi

# Test 3: Check if Jekyll can build
echo -e "${BLUE}Test 3:${NC} Testing Jekyll build..."
export BUNDLE_GEMFILE="$PROJECT_ROOT/configs/Gemfile"
if bundle exec jekyll build --quiet; then
    echo -e "${GREEN}✅${NC} Jekyll build successful"
else
    echo -e "${RED}❌${NC} Jekyll build failed"
    exit 1
fi

# Test 4: Check build output
echo -e "${BLUE}Test 4:${NC} Checking build output..."
if [ -d "$PROJECT_ROOT/_site" ]; then
    FILE_COUNT=$(find "$PROJECT_ROOT/_site" -type f | wc -l)
    DIR_SIZE=$(du -sh "$PROJECT_ROOT/_site" | cut -f1)
    echo -e "${GREEN}✅${NC} Build directory exists"
    echo "   Files: $FILE_COUNT"
    echo "   Size: $DIR_SIZE"
else
    echo -e "${RED}❌${NC} Build directory not found"
    exit 1
fi

# Test 5: Check key files exist
echo -e "${BLUE}Test 5:${NC} Checking key files..."
KEY_FILES=("_site/index.html" "_site/assets/css/main.css")
for file in "${KEY_FILES[@]}"; do
    if [ -f "$PROJECT_ROOT/$file" ]; then
        echo -e "${GREEN}✅${NC} $file exists"
    else
        echo -e "${RED}❌${NC} $file not found"
    fi
done

# Test 6: Check rsync availability
echo -e "${BLUE}Test 6:${NC} Checking rsync availability..."
if command -v rsync &> /dev/null; then
    RSYNC_VERSION=$(rsync --version | head -1)
    echo -e "${GREEN}✅${NC} rsync available: $RSYNC_VERSION"
else
    echo -e "${RED}❌${NC} rsync not found"
    exit 1
fi

# Test 7: Check SSH client
echo -e "${BLUE}Test 7:${NC} Checking SSH client..."
if command -v ssh &> /dev/null; then
    SSH_VERSION=$(ssh -V 2>&1 | head -1)
    echo -e "${GREEN}✅${NC} SSH available: $SSH_VERSION"
else
    echo -e "${RED}❌${NC} SSH client not found"
    exit 1
fi

# Test 8: Check logs directory
echo -e "${BLUE}Test 8:${NC} Checking logs directory..."
if [ -d "$PROJECT_ROOT/logs" ]; then
    echo -e "${GREEN}✅${NC} Logs directory exists"
else
    echo -e "${YELLOW}⚠️${NC} Creating logs directory..."
    mkdir -p "$PROJECT_ROOT/logs"
    echo -e "${GREEN}✅${NC} Logs directory created"
fi

echo ""
echo "=========================================="
echo -e "${GREEN}DEPLOYMENT TEST COMPLETED${NC}"
echo "=========================================="
echo ""
echo "🎯 Next Steps:"
echo "1. Set up SSH access to $REMOTE_USER@$REMOTE_HOST"
echo "2. Run: ssh-copy-id $REMOTE_USER@$REMOTE_HOST"
echo "3. Test SSH: ssh $REMOTE_USER@$REMOTE_HOST"
echo "4. Deploy: ./scripts/deploy.sh"
echo ""
echo "📚 For detailed instructions, see: DEPLOYMENT_README.md"
echo ""
echo "🚀 Ready for deployment!"