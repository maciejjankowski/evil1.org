#!/bin/bash
# scripts/minify-assets.sh
# Basic HTML/CSS/JS minification for better performance

echo "🗜️  Minifying assets for better performance..."

# Check if we have basic tools
if ! command -v sed &> /dev/null; then
    echo "❌ sed command not found"
    exit 1
fi

# Create backup directory
backup_dir="backups/minify_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$backup_dir"

echo "📁 Backup directory: $backup_dir"

# Minify HTML files
echo "📄 Minifying HTML files..."
html_count=0
for file in _site/**/*.html; do
    if [ -f "$file" ]; then
        cp "$file" "$backup_dir/"
        # Basic HTML minification: remove extra whitespace and comments
        sed -i 's/<!--.*-->//g; s/[[:space:]]\+/ /g; s/> </></g' "$file"
        html_count=$((html_count + 1))
    fi
done
echo "✅ Minified $html_count HTML files"

# Minify CSS files (basic)
echo "🎨 Minifying CSS files..."
css_count=0
for file in _site/**/*.css; do
    if [ -f "$file" ]; then
        cp "$file" "$backup_dir/"
        # Basic CSS minification: remove comments and extra whitespace
        sed -i 's|/\*[^*]*\*\+\([^/*][^*]*\*\+\)*/||g; s/[[:space:]]\+/ /g; s/; /;/g' "$file"
        css_count=$((css_count + 1))
    fi
done
echo "✅ Minified $css_count CSS files"

# Minify JS files (basic)
echo "⚡ Minifying JavaScript files..."
js_count=0
for file in _site/**/*.js; do
    if [ -f "$file" ]; then
        cp "$file" "$backup_dir/"
        # Basic JS minification: remove comments and extra whitespace
        sed -i 's|//.*$||g; s|/\*[^*]*\*\+\([^/*][^*]*\*\+\)*/||g; s/[[:space:]]\+/ /g' "$file"
        js_count=$((js_count + 1))
    fi
done
echo "✅ Minified $js_count JavaScript files"

# Calculate space savings
echo ""
echo "📊 Optimization Results:"
echo "========================"

original_size=$(du -sb "$backup_dir" | cut -f1)
current_size=$(du -sb _site | cut -f1)
savings=$((original_size - current_size))

echo "Original size: $(numfmt --to=iec-i --suffix=B $original_size)"
echo "Optimized size: $(numfmt --to=iec-i --suffix=B $current_size)"
echo "Space saved: $(numfmt --to=iec-i --suffix=B $savings)"
echo "Reduction: $(echo "scale=1; $savings * 100 / $original_size" | bc)%"

echo ""
echo "🎉 Asset minification complete!"
echo "💾 Backup saved to: $backup_dir"
echo ""
echo "💡 Note: This is basic minification. For production sites,"
echo "   consider using specialized tools like html-minifier, cssnano, or terser."
