// https://issues.dlang.org/show_bug.cgi?id=20965
// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail20965.d(17): Deprecation: `struct S` implicitly-generated postblit hides copy constructor.
compilable/fail20965.d(17):        The field postblit will have priority over the copy constructor.
compilable/fail20965.d(17):        To change this, the postblit should be disabled for `struct S`
---
*/

struct C
{
    this(this) {}
}

struct S
{
    C c;
    @disable this(ref typeof(this));
}

void main()
{
    S s1;
    auto s2 = s1; // problem
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
