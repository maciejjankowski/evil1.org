#!/bin/bash
# scripts/quality-check.sh
# Check content quality metrics for all articles

echo "🔍 Content Quality Analysis Report"
echo "=================================="
echo "Date: $(date)"
echo ""

# Initialize counters
total_articles=0
missing_titles=0
missing_descriptions=0
missing_dates=0
low_word_count=0
missing_authors=0
total_words=0

# Check each article
for file in _articles/*.md; do
    if [ -f "$file" ]; then
        total_articles=$((total_articles + 1))
        filename=$(basename "$file" .md)

        # Check for required front matter
        if ! grep -q "^title:" "$file"; then
            echo "❌ Missing title: $filename"
            missing_titles=$((missing_titles + 1))
        fi

        if ! grep -q "^description:" "$file"; then
            echo "❌ Missing description: $filename"
            missing_descriptions=$((missing_descriptions + 1))
        fi

        if ! grep -q "^date:" "$file"; then
            echo "❌ Missing date: $filename"
            missing_dates=$((missing_dates + 1))
        fi

        if ! grep -q "^author:" "$file"; then
            echo "⚠️  Missing author: $filename"
            missing_authors=$((missing_authors + 1))
        fi

        # Check word count
        words=$(grep -o '\w\+' "$file" | wc -l)
        total_words=$((total_words + words))

        if [ "$words" -lt 300 ]; then
            echo "⚠️  Low word count ($words): $filename"
            low_word_count=$((low_word_count + 1))
        fi

        # Check for SEO elements
        if ! grep -q "^tags:" "$file"; then
            echo "ℹ️  No tags: $filename"
        fi

        # Check for images
        if ! grep -q "!\[.*\](" "$file"; then
            echo "ℹ️  No images: $filename"
        fi
    fi
done

echo ""
echo "📊 Summary Statistics"
echo "===================="
echo "Total Articles: $total_articles"
echo "Total Words: $(numfmt --to=iec-i --suffix=B $total_words)"
echo ""

echo "❌ Critical Issues:"
echo "  Missing Titles: $missing_titles"
echo "  Missing Descriptions: $missing_descriptions"
echo "  Missing Dates: $missing_dates"
echo ""

echo "⚠️  Quality Warnings:"
echo "  Missing Authors: $missing_authors"
echo "  Low Word Count (<300): $low_word_count"
echo ""

# Calculate average word count
if [ $total_articles -gt 0 ]; then
    avg_words=$((total_words / total_articles))
    echo "📈 Average Word Count: $avg_words"
    echo "🎯 Quality Score: $(echo "scale=1; (1 - ($missing_titles + $missing_descriptions + $missing_dates) / ($total_articles * 3)) * 100" | bc)%"
fi

echo ""
echo "💡 Recommendations:"
if [ $missing_titles -gt 0 ] || [ $missing_descriptions -gt 0 ]; then
    echo "  • Add missing titles and descriptions for better SEO"
fi
if [ $low_word_count -gt 0 ]; then
    echo "  • Expand articles with low word count for better engagement"
fi
if [ $missing_authors -gt 0 ]; then
    echo "  • Add author information for credibility"
fi

echo ""
echo "✅ Quality check complete!"
