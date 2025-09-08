#!/bin/bash
# scripts/optimize-images.sh
# Optimize all images in assets folder for better performance

echo "🖼️  Optimizing images for better performance..."

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "❌ ImageMagick not found. Installing..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install imagemagick
    else
        echo "Please install ImageMagick manually for your system"
        exit 1
    fi
fi

# Create optimized directory if it doesn't exist
mkdir -p assets/images/optimized

# Counter for processed images
processed=0
saved_bytes=0

echo "📊 Processing images..."

# Process all images
for img in assets/images/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
    if [ -f "$img" ]; then
        filename=$(basename "$img")
        optimized="assets/images/optimized/$filename"

        # Get original file size
        original_size=$(stat -f%z "$img" 2>/dev/null || stat -c%s "$img" 2>/dev/null)

        # Optimize image
        if [[ "$img" == *.png ]]; then
            # PNG optimization
            convert "$img" -strip -quality 85 -define png:compression-level=9 "$optimized"
        else
            # JPEG optimization
            convert "$img" -strip -quality 85 -interlace Plane -gaussian-blur 0.05 "$optimized"
        fi

        # Get optimized file size
        optimized_size=$(stat -f%z "$optimized" 2>/dev/null || stat -c%s "$optimized" 2>/dev/null)

        # Calculate savings
        savings=$((original_size - optimized_size))
        saved_bytes=$((saved_bytes + savings))

        echo "✅ $filename: $(numfmt --to=iec-i --suffix=B $original_size) → $(numfmt --to=iec-i --suffix=B $optimized_size) (saved $(numfmt --to=iec-i --suffix=B $savings))"

        processed=$((processed + 1))
    fi
done

# Replace original images with optimized versions
if [ $processed -gt 0 ]; then
    echo "🔄 Replacing original images with optimized versions..."
    mv assets/images/optimized/* assets/images/ 2>/dev/null
    rmdir assets/images/optimized

    echo ""
    echo "🎉 Image optimization complete!"
    echo "📊 Processed: $processed images"
    echo "💾 Total space saved: $(numfmt --to=iec-i --suffix=B $saved_bytes)"
    echo "⚡ Performance improvement: ~$(echo "scale=1; $saved_bytes * 100 / (1024*1024)" | bc)MB faster loading"
else
    echo "ℹ️  No images found to optimize"
fi
