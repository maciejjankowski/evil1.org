#!/bin/bash
# scripts/monitor-performance.sh
# Monitor site performance metrics

echo "⚡ Site Performance Analysis"
echo "==========================="
echo "Date: $(date)"
echo ""

# Build the site first
echo "🔨 Building site..."
bundle exec jekyll build --quiet

if [ $? -ne 0 ]; then
    echo "❌ Build failed! Please fix build errors first."
    exit 1
fi

echo "✅ Site built successfully"
echo ""

# Analyze build performance
echo "📊 Build Performance:"
echo "  Build directory size: $(du -sh _site | cut -f1)"
echo "  Total HTML files: $(find _site -name "*.html" | wc -l)"
echo "  Total assets: $(find _site/assets -type f | wc -l)"
echo ""

# Analyze page sizes
echo "📏 Page Size Analysis:"
echo "Largest pages:"
find _site -name "*.html" -exec wc -c {} \; | sort -nr | head -5 | while read size file; do
    filename=$(basename "$file")
    echo "  $filename: $(numfmt --to=iec-i --suffix=B $size)"
done
echo ""

# Analyze images
echo "🖼️  Image Analysis:"
if [ -d "_site/assets/images" ]; then
    echo "  Total images: $(find _site/assets/images -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | wc -l)"
    echo "  Total image size: $(find _site/assets/images -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec stat -f%z {} \; | awk '{sum += $1} END {print sum}' | numfmt --to=iec-i --suffix=B)"

    echo "Largest images:"
    find _site/assets/images -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec stat -f%z {} \; -print | sort -nr | head -3 | while read size file; do
        filename=$(basename "$file")
        echo "  $filename: $(numfmt --to=iec-i --suffix=B $size)"
    done
else
    echo "  No images directory found"
fi
echo ""

# Analyze CSS and JS
echo "🎨 Asset Analysis:"
echo "CSS files:"
find _site -name "*.css" -exec wc -c {} \; | while read size file; do
    filename=$(basename "$file")
    echo "  $filename: $(numfmt --to=iec-i --suffix=B $size)"
done

echo "JavaScript files:"
find _site -name "*.js" -exec wc -c {} \; | while read size file; do
    filename=$(basename "$file")
    echo "  $filename: $(numfmt --to=iec-i --suffix=B $size)"
done
echo ""

# Check for performance issues
echo "🚨 Performance Issues Check:"

# Check for uncompressed assets
uncompressed_css=$(find _site -name "*.css" -exec grep -l "{" {} \; | wc -l)
uncompressed_js=$(find _site -name "*.js" -exec grep -l "function\|var\|let\|const" {} \; | wc -l)

if [ "$uncompressed_css" -gt 0 ]; then
    echo "⚠️  Found $uncompressed_css uncompressed CSS files (consider minification)"
fi

if [ "$uncompressed_js" -gt 0 ]; then
    echo "⚠️  Found $uncompressed_js uncompressed JS files (consider minification)"
fi

# Check for large images
large_images=$(find _site/assets/images -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -size +500k 2>/dev/null | wc -l)
if [ "$large_images" -gt 0 ]; then
    echo "⚠️  Found $large_images images larger than 500KB (consider optimization)"
fi

# Check for missing alt text (basic check)
missing_alt=$(grep -r "img" _site --include="*.html" | grep -v "alt=" | wc -l)
if [ "$missing_alt" -gt 0 ]; then
    echo "⚠️  Found $missing_alt images without alt text"
fi

echo ""
echo "💡 Recommendations:"
echo "  • Run image optimization: ./scripts/optimize-images.sh"
echo "  • Check content quality: ./scripts/quality-check.sh"
echo "  • Consider adding compression for CSS/JS files"
echo "  • Add lazy loading for images"
echo "  • Implement caching headers"

echo ""
echo "✅ Performance analysis complete!"
