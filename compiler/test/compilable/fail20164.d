// REQUIRED_ARGS: -dw
// EXTRA_FILES: imports/fail20164.d
/*
TEST_OUTPUT:
---
compilable/fail20164.d(13): Deprecation: module `imports.fail20164` is deprecated
---
*/
module fail20164;

void foo()
{
    import imports.fail20164;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
