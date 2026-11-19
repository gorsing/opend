/*
REQUIRED_ARGS: -dw
*/

/*
TEST_OUTPUT:
---
compilable/retscope4.d(3007): Deprecation: slice of static array temporary returned by `func()` assigned to longer lived variable `a`
---
*/

#line 3000

// https://issues.dlang.org/show_bug.cgi?id=12625

int[16] func();

void foo()
{
    int[] a = func();
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
