/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/fail9735.d(10): Deprecation: casting from void delegate() to void* is deprecated
---
*/

void* dg2ptr(void delegate() dg) {
    return cast(void*) dg;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
