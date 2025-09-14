#!/usr/bin/env python3
import re
import os
import shutil
from collections import OrderedDict

def resolve_merge_conflicts(content):
    """
    Remove Git merge conflict markers and combine both sides of conflicts.
    """
    lines = content.split('\n')
    resolved_lines = []
    i = 0

    while i < len(lines):
        line = lines[i]

        # Check for start of merge conflict
        if line.startswith('<<<<<<< '):
            # Find the end of the conflict
            conflict_start = i
            head_content = []
            other_content = []

            # Skip the HEAD marker
            i += 1

            # Collect HEAD content until =======
            while i < len(lines) and not lines[i].startswith('======='):
                head_content.append(lines[i])
                i += 1

            # Skip the ======= marker
            if i < len(lines) and lines[i].startswith('======='):
                i += 1

            # Collect other branch content until >>>>>>>
            while i < len(lines) and not lines[i].startswith('>>>>>>> '):
                other_content.append(lines[i])
                i += 1

            # Skip the closing marker
            if i < len(lines) and lines[i].startswith('>>>>>>> '):
                i += 1

            # Combine both sides with a separator
            resolved_lines.extend(head_content)
            if other_content:  # Only add separator if there's other content
                resolved_lines.append('')  # Empty line for separation
                resolved_lines.extend(other_content)

        else:
            resolved_lines.append(line)
            i += 1

    return '\n'.join(resolved_lines)

def consolidate_backlog(filepath):
    """
    Reads a Markdown backlog file, removes duplicate tasks based on ID and description,
    and overwrites the file with the cleaned content. A backup of the original
    file is created.
    """
    if not os.path.exists(filepath):
        print(f"Error: File not found at {filepath}")
        return

    # First, read the raw content and resolve any merge conflicts
    with open(filepath, 'r') as f:
        raw_content = f.read()

    # Check if there are merge conflicts
    if '<<<<<<< ' in raw_content:
        print("Merge conflicts detected. Resolving...")
        resolved_content = resolve_merge_conflicts(raw_content)

        # Write back the resolved content
        with open(filepath, 'w') as f:
            f.write(resolved_content)

        print("Merge conflicts resolved. Both sides have been combined.")
    else:
        resolved_content = raw_content

    backup_path = f"{filepath}.bak"
    shutil.copy(filepath, backup_path)
    print(f"Backup of original backlog created at: {backup_path}")

    header_lines = []
    tasks = OrderedDict()  # Preserve order while allowing easy access by ID
    task_descriptions = set()

    # Split content into lines, handling different line ending formats
    lines = re.split(r'\r\n|\r|\n', resolved_content)
    print(f"Processing {len(lines)} lines from file...")

    task_pattern = re.compile(r"^\s*\[([ x])\]\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|\s*([^|]+)\s*\|\s*(.+)$")

    def get_status_priority(status):
        """Return priority value for status (higher = more complete)"""
        if status == '[x]':
            return 3  # Completed
        elif status == '[ ]':
            return 1  # Not started
        else:
            return 2  # In progress or other

    print("Starting task processing...")

    for line in lines:
        match = task_pattern.match(line)
        if match:
            status = f"[{match.group(1)}]"
            task_id = match.group(2).strip()
            description = match.group(3).strip()
            model = match.group(4).strip()
            dod = match.group(5).strip()

            # Rule 1: If we've seen this description before, it's a duplicate.
            if description in task_descriptions:
                print(f"Skipping duplicate description: '{description}'")
                continue

            # Rule 2: If we've seen this TASK_ID before, decide which to keep.
            if task_id in tasks:
                existing_status = tasks[task_id]['status']
                existing_priority = get_status_priority(existing_status)
                new_priority = get_status_priority(status)

                # Keep the task with the higher priority status
                if new_priority > existing_priority:
                    print(f"Updating status for TASK_ID {task_id} from '{existing_status}' to '{status}' (higher priority)")
                    # Remove old description from set to replace it
                    task_descriptions.discard(tasks[task_id]['description'])
                    tasks[task_id] = {'line': line, 'status': status, 'description': description, 'model': model, 'dod': dod}
                    task_descriptions.add(description)
                else:
                    print(f"Skipping duplicate TASK_ID: {task_id} (keeping existing status '{existing_status}')")
                continue

            # If it's a new task, add it.
            tasks[task_id] = {'line': line, 'status': status, 'description': description, 'model': model, 'dod': dod}
            task_descriptions.add(description)
        else:
            # Preserve headers and other non-task lines
            if not tasks: # Only add to headers if we haven't seen tasks yet
                header_lines.append(line)

    # Write the cleaned content back to the file
    with open(filepath, 'w') as f:
        f.writelines(header_lines)
        for task_id in tasks:
            f.write(tasks[task_id]['line'] + '\n')

    print(f"\nBacklog consolidation complete. {len(tasks)} unique tasks remain.")
    print(f"File '{filepath}' has been updated.")

if __name__ == "__main__":
    # Assuming the script is run from the root of the project
    backlog_file = os.path.join('_docs', 'backlog-all.md')
    consolidate_backlog(backlog_file)
