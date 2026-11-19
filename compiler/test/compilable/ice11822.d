

// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/ice11822.d(33): Deprecation: function `ice11822.d` is deprecated
compilable/ice11822.d(16):        instantiated from here: `__lambda2!int`
compilable/ice11822.d(22):        instantiated from here: `S!(__lambda2)`
compilable/ice11822.d(33):        instantiated from here: `g!((n) => d(i))`
---
*/

struct S(alias pred)
{
    this(int) { pred(1); }
    void f()  { pred(2); }
}

auto g(alias pred)()
{
    return S!pred(3);
}

deprecated bool d(int)
{
    return true;
}

auto h()
{
    int i;
    return g!(n => d(i))();
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
