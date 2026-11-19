// REQUIRED_ARGS: -dw
// EXTRA_SOURCES: imports/test21651b.d
/* TEST_OUTPUT:
---
compilable/test21651.d(11): Deprecation: module imports.test21651b is not accessible here, perhaps add 'static import imports.test21651b;'
---
*/

module imports.test21651;

imports.test21651b.T a;

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
