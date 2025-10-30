Execute a deep code analysis of the current file:

## 1. Complexity Analysis
- Identify functions with cyclomatic complexity > 10
- Flag deeply nested code (> 4 levels of indentation)
- Detect long functions (> 50 lines)
- Identify functions with too many parameters (> 5)

## 2. Code Quality
- Check for code duplication (DRY principle violations)
- Identify magic numbers and hard-coded values
- Look for missing error handling (try/catch, error checks)
- Detect inconsistent naming conventions
- Find commented-out code that should be removed

## 3. Performance Concerns
- Spot potential performance bottlenecks
- Identify inefficient algorithms (nested loops, O(n²) operations)
- Check for unnecessary re-renders (React components)
- Look for memory leaks (event listeners not cleaned up)
- Identify expensive operations in loops

## 4. Security Issues
- Look for SQL injection vulnerabilities (string concatenation in queries)
- Check for XSS vulnerabilities (unescaped user input)
- Identify exposed secrets or API keys in code
- Check for insecure file operations
- Look for unsafe use of eval() or similar dangerous functions

## 5. Best Practices
- Check if functions follow Single Responsibility Principle
- Verify proper use of async/await vs promises
- Look for proper TypeScript typing (any usage, missing types)
- Check for proper error messages and logging
- Verify proper resource cleanup (files, connections, etc.)

## Output Format
For each issue found:
1. **Category**: [Complexity/Quality/Performance/Security/Best Practices]
2. **Severity**: [Critical/High/Medium/Low]
3. **Location**: File:LineNumber
4. **Issue**: Clear description of the problem
5. **Recommendation**: Specific fix with code example
6. **Priority**: What to fix first

Provide actionable recommendations with code examples showing before/after.
