/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/test20655.d(29): Deprecation: `@safe` function `g` calling `f1`
compilable/test20655.d(24):        which wouldn't be `@safe` because of:
compilable/test20655.d(24):        field `U.s` cannot access pointers in `@safe` code that overlap other fields
compilable/test20655.d(30): Deprecation: `@safe` function `g` calling `f2`
compilable/test20655.d(25):        which wouldn't be `@safe` because of:
compilable/test20655.d(25):        field `U.s` cannot access pointers in `@safe` code that overlap other fields
compilable/test20655.d(31): Deprecation: `@safe` function `g` calling `f3`
compilable/test20655.d(28):        which wouldn't be `@safe` because of:
compilable/test20655.d(28):        field `U.s` cannot access pointers in `@safe` code that overlap other fields
---
*/

union U
{
    string s;
    int x;
}
U u;

auto f1() { auto s = u.s; } /* Should be inferred as @system. */
void f2()() { auto s = u.s; } /* ditto */
void g() @safe
{
    void f3() { auto s = u.s; } /* ditto */
    f1(); /* Should be rejected with error "cannot call @system function". */
    f2(); /* ditto */
    f3(); /* ditto */
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
