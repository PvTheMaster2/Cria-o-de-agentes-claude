# PR Review Process

This PR: #[NUMBER]

## Stage 1: Understanding (5 min)

### Commands to Execute
```bash
gh pr view [NUMBER]
gh pr diff [NUMBER]
```

### Questions to Answer
1. What is the main purpose of this PR?
2. Which parts of the system are affected?
3. Are there any breaking changes?
4. What files were modified/added/deleted?
5. How many lines of code changed?

## Stage 2: Checkout & Build (5 min)

### Commands to Execute
```bash
gh pr checkout [NUMBER]
npm install  # or yarn install, pnpm install
npm run build
```

### Verification Checklist
- [ ] Build succeeds without errors
- [ ] No new warnings introduced
- [ ] Dependencies installed successfully
- [ ] No TypeScript/ESLint errors

## Stage 3: Manual Testing (10 min)

### Testing Steps
1. Start the application (`npm run dev` or equivalent)
2. Test the new functionality described in PR
3. Test existing functionality (regression testing)
4. Check edge cases:
   - Empty input
   - Invalid input
   - Boundary conditions
   - Error scenarios

### Document Findings
- ✅ What works as expected?
- ❌ What doesn't work?
- ⚠️ Any unexpected behavior?
- 🐛 Any bugs discovered?

## Stage 4: Code Analysis (15 min)

For EACH changed file, analyze:

### A. Code Quality
- Is code readable and maintainable?
- Are variable/function names clear and descriptive?
- Are there complex functions that should be split?
- Is there code duplication (DRY violations)?
- Is the code properly commented where necessary?

### B. Logic & Correctness
- Does the logic make sense?
- Are there edge cases not handled?
- Could this fail in production?
- Are error messages helpful?
- Is there proper input validation?

### C. Performance
- Are there inefficient operations (nested loops, O(n²))?
- Could this cause memory leaks?
- Are database queries optimized?
- Is there unnecessary re-rendering (React)?
- Are expensive operations properly memoized/cached?

### D. Security
- Is user input sanitized?
- Are there SQL injection risks?
- Are there XSS vulnerabilities?
- Are secrets properly managed (not hardcoded)?
- Is authentication/authorization properly implemented?

### E. Testing
- Are there unit tests for new functionality?
- Do tests cover edge cases?
- Are integration tests needed?
- Is test coverage adequate (aim for 80%+)?
- Are tests isolated and deterministic?

### F. Documentation
- Is the code self-documenting?
- Are complex algorithms explained?
- Is README updated if needed?
- Are API changes documented?
- Are breaking changes clearly marked?

## Stage 5: Architecture & Design

### Evaluate
- Does this follow existing patterns in the codebase?
- Is the solution scalable?
- Are there better alternative approaches?
- Does this introduce technical debt?
- Is the abstraction level appropriate?

## Final Report

### Summary
[Brief 2-3 sentence description of what the PR does]

### Strengths
- [What was done well - be specific]
- [Good practices followed]
- [Well-tested areas]

### Critical Issues (Must Fix Before Merge)
1. **[Issue]**
   - Location: `file.ts:123`
   - Problem: [Description]
   - Fix: [Specific recommendation]

### Important Concerns (Should Fix)
1. **[Issue]**
   - Impact: [Why this matters]
   - Suggestion: [How to improve]

### Nice-to-Have Improvements (Optional)
1. **[Improvement]**
   - Benefit: [What this would improve]
   - Effort: [Estimated complexity]

### Testing Results
- [ ] Manual testing passed
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] No regression issues found

### Performance Impact
- ⚡ Performance improved / unchanged / degraded
- 📊 Details: [Specific metrics if available]

### Security Assessment
- 🔒 No security issues found / Issues found (list them)

### Recommendation
Choose one:
- [ ] ✅ **Approve** - Ready to merge
- [ ] 🔄 **Request Changes** - Critical issues must be fixed
- [ ] 💬 **Needs Discussion** - Requires team discussion
- [ ] ⏸️ **On Hold** - Blocked by other work

### Next Steps
[What should happen next - be specific]

---

## Review Checklist

Before submitting review, ensure:
- [ ] All stages completed
- [ ] Tested manually
- [ ] Code analyzed thoroughly
- [ ] Clear recommendation provided
- [ ] Specific, actionable feedback given
- [ ] Positive feedback included (not just criticism)
