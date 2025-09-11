#!/usr/bin/env bash
set -euo pipefail

# Optimize images under assets/ and images/ - dry-run by default
# Usage: ./scripts/optimize-images.sh [--apply] [--quality N]

APPLY=0
QUALITY=85

while [[ $# -gt 0 ]]; do
  case "$1" in
    --apply) APPLY=1; shift ;;
    --quality) QUALITY="$2"; shift 2 ;;
    --help|-h) echo "Usage: $0 [--apply] [--quality N]"; exit 0 ;;
    *) echo "Unknown arg: $1"; exit 1 ;;
  esac
done

ROOT="$(pwd)"
SEARCH_DIRS=("assets" "assets/images" "images" "img")

FILES=()
for d in "${SEARCH_DIRS[@]}"; do
  if [ -d "$d" ]; then
    while IFS= read -r -d $'\0' f; do
      FILES+=("$f")
    done < <(find "$d" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -print0)
  fi
done

if [ ${#FILES[@]} -eq 0 ]; then
  echo "No images found in ${SEARCH_DIRS[*]}. Nothing to do." >&2
  exit 0
fi

echo "Found ${#FILES[@]} images. Dry-run mode: ${APPLY:-0} (use --apply to modify)."
echo "Quality target: $QUALITY"
echo ""

for f in "${FILES[@]}"; do
  old_size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null || echo 0)
  echo "File: $f (size: $old_size bytes)"

  if [ "$APPLY" -eq 0 ]; then
    # Suggest command depending on available tools
    if command -v jpegoptim >/dev/null 2>&1 && [[ $f =~ \.(jpe?g)$ ]]; then
      echo "  -> jpegoptim --max=$QUALITY $f"
    elif command -v pngquant >/dev/null 2>&1 && [[ $f =~ \.png$ ]]; then
      echo "  -> pngquant --quality=${QUALITY}-${QUALITY} --ext .png --force $f"
    elif command -v magick >/dev/null 2>&1; then
      echo "  -> magick $f -strip -quality $QUALITY $f.tmp && mv $f.tmp $f"
    elif command -v convert >/dev/null 2>&1; then
      echo "  -> convert $f -strip -quality $QUALITY $f.tmp && mv $f.tmp $f"
    else
      echo "  -> No image optimization tools found (jpegoptim/pngquant/convert). Install one to apply optimizations." >&2
    fi
  else
    # Apply best-effort optimization
    if command -v jpegoptim >/dev/null 2>&1 && [[ $f =~ \.(jpe?g)$ ]]; then
      jpegoptim --max=$QUALITY --strip-all "$f" || true
    elif command -v pngquant >/dev/null 2>&1 && [[ $f =~ \.png$ ]]; then
      tmp="${f%.*}.optimized.png"
      pngquant --quality=${QUALITY}-${QUALITY} -o "$tmp" -- "$f" || true
      if [ -f "$tmp" ]; then mv "$tmp" "$f"; fi
    elif command -v magick >/dev/null 2>&1; then
      magick "$f" -strip -quality "$QUALITY" "$f.tmp" && mv "$f.tmp" "$f" || true
    elif command -v convert >/dev/null 2>&1; then
      convert "$f" -strip -quality "$QUALITY" "$f.tmp" && mv "$f.tmp" "$f" || true
    else
      echo "No optimization tool available; skipping $f" >&2
    fi

    new_size=$(stat -f%z "$f" 2>/dev/null || stat -c%s "$f" 2>/dev/null || echo 0)
    echo "  -> optimized: $old_size -> $new_size bytes"
  fi

  echo ""
done

echo "Done. To apply changes, re-run with --apply (and ensure appropriate tools are installed)."
