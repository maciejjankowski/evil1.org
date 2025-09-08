# How to Work with Copilot Code AI Agents - Complete Guide

## 📋 **Best Practices for AI Agent Instruction Compliance**

### 1. **Explicit Instruction References in Prompts**

Always start your prompts with clear instruction references:

```
Before starting any work, read these instruction files:
- _docs/instructions.md (core rules and principles)
- _docs/workflow.md (complete workflow and model selection)
- _docs/backlog.md (current tasks)

Then proceed with: [your specific request]
```

### 2. **Use Context Attachment**

In VS Code Copilot Chat:
- **Attach the instruction files** as context using `@workspace` or file references
- **Reference specific sections** when relevant to the task
- **Include the backlog.md** so the agent knows current task status

Example:
```
@workspace Look at _docs/instructions.md and _docs/workflow.md, then help me fix the 404 errors following the established workflow.
```

### 3. **Start Each Session with File Reading**

Begin conversations by having the agent read the key files:

```
Please read and acknowledge the following instruction files before we begin:
1. /Users/mj/code/evil1.org/_docs/instructions.md
2. /Users/mj/code/evil1.org/_docs/workflow.md  
3. /Users/mj/code/evil1.org/_docs/backlog.md

Confirm you understand the core rules, workflow, and current tasks.
```

### 4. **Reference Specific Rules When Needed**

When you notice non-compliance, reference specific rules:

```
❌ STOP - You're about to modify the backlog.md header section. 
Please review the CRITICAL RULE in _docs/instructions.md about never modifying the backlog header.
Only change task status checkboxes in the # TASKS section.
```

### 5. **Use Workflow Commands**

Reference the established workflow protocols:

```
Follow the model selection protocol in _docs/workflow.md:
- Assess this task complexity as [High/Medium/Low]
- Recommend the appropriate Copilot model
- Follow the quality assurance steps before marking complete
```

## 🎯 **Optimal Prompt Patterns**

### **For New Sessions:**
```
I'm working on the evil1.org Jekyll site. Before starting:

1. Read _docs/instructions.md for core rules
2. Read _docs/workflow.md for the complete process  
3. Read _docs/backlog.md for current tasks
4. Select appropriate model based on task complexity

Task: [your specific request]
```

### **For Task Execution:**
```
Following the workflow in _docs/workflow.md:
- Assess complexity: [High/Medium/Low]
- Recommended model: [Model name]
- Quality checks required: [List from workflow]

Execute: [specific task]
```

### **For Compliance Enforcement:**
```
⚠️ REMINDER: Check _docs/instructions.md CRITICAL RULES section
- Never modify backlog.md header
- Always test before marking complete  
- Use proper commit format: [MODEL] Description

Now proceed with: [task]
```

## 🔧 **Setup Strategies**

### **Create a Standard Prompt Template**

Save this as a snippet in VS Code:

```
## EVIL1.ORG AI AGENT SETUP
Read before starting: _docs/instructions.md, _docs/workflow.md, _docs/backlog.md

CRITICAL REMINDERS:
- Never modify backlog.md header section
- Test all changes before marking complete
- Use proper commit format: [MODEL] Description
- Follow model selection guidelines

TASK: [INSERT_TASK_HERE]
COMPLEXITY: [High/Medium/Low]
RECOMMENDED_MODEL: [Model_Name]
```

### **Use Workspace-Aware Commands**

In VS Code, use commands that include workspace context:

```
/explain @workspace _docs/instructions.md
/fix @workspace following the rules in _docs/workflow.md
```

### **Set Up Chat Variables**

If available, create chat variables for common references:

```
#instructions = "Read _docs/instructions.md for core rules"
#workflow = "Follow _docs/workflow.md for complete process"  
#backlog = "Check _docs/backlog.md for current tasks"
```

## 🛡️ **Compliance Monitoring**

### **Check for Rule Violations**

Watch for these common violations:

```
❌ Modifying backlog.md header
❌ Using inline styles instead of CSS
❌ Not testing changes before completion
❌ Skipping model selection assessment
❌ Not following commit format
```

### **Enforcement Prompts**

When you see violations:

```
🚫 VIOLATION DETECTED: [Specific rule broken]
📖 RULE REFERENCE: _docs/instructions.md section [X]
🔄 CORRECT APPROACH: [What should be done instead]

Please restart following the proper procedure.
```

## 📚 **Training Reinforcement**

### **Provide Examples**

Show good vs bad compliance:

```
✅ GOOD: "Reading _docs/instructions.md... Following workflow.md model selection... Testing changes..."

❌ BAD: "I'll modify the backlog header and use inline styles..."
```

### **Reference Success Patterns**

Point to previous successful interactions:

```
Follow the same pattern as our previous successful task where you:
1. Read the instructions first
2. Selected GPT-4.1 for debugging complexity
3. Followed the quality checklist
4. Used proper commit format
```

## 🎯 **Key Success Factors**

### **Consistency**
- Always reference the instruction files
- Use the same prompt patterns
- Enforce compliance consistently

### **Clarity**
- Be specific about which rules apply
- Reference exact file sections when needed
- Provide clear examples of expected behavior

### **Verification**
- Ask the agent to confirm it read the instructions
- Check that it references the workflow appropriately
- Verify it follows the established patterns

## 📖 **Quick Reference Commands**

### **Session Initialization**
```
## INITIALIZE AI AGENT SESSION

Step 1: Read Instructions
- Read _docs/instructions.md for core principles and critical rules
- Read _docs/workflow.md for complete development workflow
- Read _docs/backlog.md for current task status

Step 2: Acknowledge Understanding
- Confirm you understand the critical rules (especially backlog.md restrictions)
- Confirm you understand the model selection protocol
- Confirm you understand the quality assurance requirements

Step 3: Task Assessment
- Assess task complexity: [High/Medium/Low]
- Select appropriate model: [Grok Code Fast 1/GPT-4.1/GPT-4o/GPT-5 mini]
- Identify quality checks required

Ready to proceed with task: [TASK_DESCRIPTION]
```

### **Mid-Task Compliance Check**
```
## COMPLIANCE CHECKPOINT

Before proceeding, verify:
- [ ] Following instructions from _docs/instructions.md
- [ ] Using workflow from _docs/workflow.md
- [ ] Only modifying task status in _docs/backlog.md (never header)
- [ ] Testing changes before marking complete
- [ ] Using external CSS (no inline styles)
- [ ] Proper commit format: [MODEL] Description

Continue with task execution.
```

### **Task Completion Protocol**
```
## TASK COMPLETION CHECKLIST

Before marking task complete:
- [ ] Test all changes thoroughly
- [ ] Verify no 404 errors introduced
- [ ] Check YAML front matter validity
- [ ] Run Jekyll build successfully
- [ ] Update backlog.md task status (checkboxes only)
- [ ] Commit with format: [MODEL] Brief description
- [ ] Document any learnings in improvements.md

Task complete and ready for review.
```

## 🚨 **Emergency Stop Commands**

### **When Agent Goes Off-Track**
```
🛑 EMERGENCY STOP

You are violating the established instructions. 

REQUIRED ACTIONS:
1. Stop current approach immediately
2. Re-read _docs/instructions.md (especially CRITICAL RULES)
3. Re-read _docs/workflow.md for proper procedure
4. Restart task following the correct protocol

DO NOT PROCEED until you confirm understanding of the rules.
```

### **Backlog Protection**
```
🚫 BACKLOG VIOLATION ALERT

You are about to modify the backlog.md header section.

CRITICAL RULE: Only modify task status checkboxes ([ ] to [x]) in the # TASKS section.
NEVER change: Header, instructions, model selection guidelines

Restart and follow the backlog management rules in _docs/instructions.md
```

## 💡 **Pro Tips for Effective AI Collaboration**

### **Be Explicit and Specific**
- Don't assume the AI remembers previous sessions
- Always reference the specific instruction files
- Be clear about which rules are most important for the current task

### **Use Progressive Disclosure**
- Start with basic instructions
- Add specific constraints as needed
- Reference detailed procedures when complexity increases

### **Maintain Consistency**
- Use the same command patterns across sessions
- Enforce the same quality standards
- Reference the same instruction files

### **Monitor and Correct**
- Watch for rule violations early
- Correct deviations immediately
- Reinforce successful compliance patterns

By following these strategies, you'll ensure that Copilot Code AI agents consistently read and follow the comprehensive instruction system you've established in the `_docs` folder.
