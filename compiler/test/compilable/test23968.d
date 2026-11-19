// https://issues.dlang.org/show_bug.cgi?id=23968

// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/test23968.d(22): Deprecation: alias `test23968.a` is deprecated
---
*/

int fun()(int)
{
    return 0;
}

deprecated alias a = fun;

void main()
{
    int v;
    int y = v.a!();  // No deprecation?
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
