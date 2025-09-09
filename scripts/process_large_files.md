# Processing Large Files in the evil1.org Project

When dealing with large files or repetitive content in this project, follow these guidelines to avoid context length issues and improve efficiency.

## Strategies for Large File Processing

### 1. Chunking Strategy

Break large files into manageable chunks:

```bash
# Example using read_file with limit and offset
read_file filePath="/path/to/large/file.md" limit=500 offset=0
read_file filePath="/path/to/large/file.md" limit=500 offset=500
# Continue as needed
```

### 2. Pattern Identification First

Before processing, identify patterns:

```bash
# Find all instances of a pattern
grep_search query="<pattern>" isRegexp=true

# Count occurrences
grep_search query="<pattern>" isRegexp=true | wc -l
```

### 3. Bulk Processing Scripts

Create scripts for repetitive operations:

```bash
#!/bin/bash
# Example script template for bulk operations
FILES=($(find /path/to/dir -name "*.md"))
for file in "${FILES[@]}"; do
  # Process each file
  sed -i '' 's/old-pattern/new-pattern/g' "$file"
done
```

### 4. Representative Sampling

Process a few examples first, then apply to the rest:

1. Select 2-3 representative files
2. Develop and test your solution
3. Create a script to apply to all files
4. Validate with spot checks

### 5. Documentation

Document your approach in commits:

```
[MODEL] Applied chunked processing to large files - 1/3 complete
```

## Example Implementation

For replacing inline styles:

```bash
#!/bin/bash
# Script to replace inline styles with CSS classes

# 1. Identify target files (small batch for testing)
TARGET_FILES=($(grep -l 'style="text-align: center"' /path/to/dir/*.md | head -5))

# 2. Process test batch and verify
for file in "${TARGET_FILES[@]}"; do
  sed -i '' 's/<div style="text-align: center">/<div class="text-center">/g' "$file"
done

# 3. After verification, process remaining files
REMAINING_FILES=($(grep -l 'style="text-align: center"' /path/to/dir/*.md))
# Continue processing
```

By following these strategies, you can efficiently process large files while staying within context limits.
