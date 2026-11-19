// REQUIRED_ARGS: -dw
// EXTRA_SOURCES: imports/ice10598a.d imports/ice10598b.d
/* TEST_OUTPUT:
---
compilable/imports/ice10598a.d(5): Deprecation: module imports.ice10598b is not accessible here, perhaps add 'static import imports.ice10598b;'
compilable/imports/ice10598a.d(5): Deprecation: module imports.ice10598b is not accessible here, perhaps add 'static import imports.ice10598b;'
---
*/

void main() {}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
