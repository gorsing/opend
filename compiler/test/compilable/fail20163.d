// REQUIRED_ARGS: -dw
// EXTRA_FILES: imports/fail20164.d
/*
TEST_OUTPUT:
---
compilable/fail20163.d-mixin-11(11): Deprecation: module `imports.fail20164` is deprecated
---
*/
module fail20163;

mixin("import imports.fail20164;");

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
