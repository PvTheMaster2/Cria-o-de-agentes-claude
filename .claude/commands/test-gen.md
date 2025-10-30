Generate comprehensive unit tests for the current file:

## 1. Test Structure
- Use Jest/Vitest framework (detect from project dependencies)
- Follow AAA pattern (Arrange, Act, Assert)
- One test file per source file
- Mirror source file structure in `__tests__` directory or use `.test.ts`/`.spec.ts` suffix

## 2. Coverage Goals
- Test ALL public functions and methods
- Include edge cases:
  - Empty input (`''`, `[]`, `{}`)
  - Null and undefined values
  - Boundary values (min, max, zero, negative)
  - Invalid input types
- Test error scenarios and exceptions
- Mock external dependencies (APIs, database, file system)

## 3. Test Quality Standards
- **Descriptive test names**: Use `it('should [expected behavior] when [condition]')` format
- **Isolated tests**: No shared state between tests
- **Fast execution**: Mock slow operations (network, disk I/O)
- **Deterministic**: Same input always produces same output
- **Avoid testing implementation details**: Test behavior, not internals

## 4. Mock Strategy
- Mock external services (HTTP requests, database queries)
- Mock file system operations
- Mock date/time for consistent tests
- Mock random number generators
- Use dependency injection where possible

## 5. Test Categories
Create tests for:
- **Happy path**: Normal, expected usage
- **Edge cases**: Boundary conditions
- **Error handling**: Invalid input, exceptions
- **Integration**: How components work together
- **Regression**: Known bugs that were fixed

## 6. Output Format
Create test file with:
```typescript
import { describe, it, expect, beforeEach, afterEach, vi } from 'vitest';
// or
import { describe, it, expect, beforeEach, afterEach, jest } from '@jest/globals';

describe('[ComponentName]', () => {
  beforeEach(() => {
    // Setup before each test
  });

  afterEach(() => {
    // Cleanup after each test
  });

  describe('[functionName]', () => {
    it('should [expected behavior] when [condition]', () => {
      // Arrange
      const input = ...;

      // Act
      const result = functionName(input);

      // Assert
      expect(result).toBe(expectedValue);
    });
  });
});
```

## 7. Special Considerations
- **React components**: Test rendering, props, events, state changes
- **Async functions**: Use `async/await` in tests
- **TypeScript**: Ensure tests are properly typed
- **Coverage target**: Aim for 80%+ code coverage

After generating tests, explain:
1. What is being tested
2. What edge cases are covered
3. What mocks are used and why
4. How to run the tests
