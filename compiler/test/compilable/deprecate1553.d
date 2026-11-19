// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/deprecate1553.d(18): Deprecation: cannot use `foreach_reverse` with a delegate
---
*/

struct S
{
    int dg(int delegate(ref int a)) { return 0; }
}

void main()
{
    S s;
    foreach_reverse(a; &s.dg) {}
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
