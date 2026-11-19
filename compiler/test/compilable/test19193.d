/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/test19193.d(13): Deprecation: enum member `test19193.T19193!int.A.b` is deprecated
---
*/

// https://issues.dlang.org/show_bug.cgi?id=19193

void main ()
{
    cast(void)T19193!int.A.b;
}

template T19193(T)
{
    enum A
    {
        deprecated b
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
