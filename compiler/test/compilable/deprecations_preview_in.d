/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---

---
*/

#line 1
extern(C) void fun1(in char*);

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
