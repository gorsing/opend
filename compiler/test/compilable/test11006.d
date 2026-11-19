/* REQUIRED_ARGS: -main -dw
 * TEST_OUTPUT:
---
compilable/test11006.d(8): Deprecation: cannot subtract pointers to different types: `void*` and `int*`.
compilable/test11006.d(9): Deprecation: cannot subtract pointers to different types: `int*` and `void*`.
---
 */
static assert(cast(void*)8 - cast(int*) 0 == 2L);
static assert(cast(int*) 8 - cast(void*)0 == 8L);

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
