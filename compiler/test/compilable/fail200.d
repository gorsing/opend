// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail200.d(17): Deprecation: interface `fail200.DepClass` is deprecated
compilable/fail200.d(17): Deprecation: interface `fail200.DepClass` is deprecated
---
*/

//import std.stdio;

deprecated interface DepClass
{
    void test();
}

class Derived : DepClass
{
    void test()
    {
        //writefln("Accessing what's deprecated!");
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
