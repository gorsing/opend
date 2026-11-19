// https://issues.dlang.org/show_bug.cgi?id=15414

// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/fail15414.d(20): Deprecation: `__traits(getAttributes)` may only be used for individual functions, not the overload set `fun`
compilable/fail15414.d(20):        the result of `__traits(getOverloads)` may be used to select the desired function to extract attributes from
---
*/

@("gigi")
void fun() {}
@("mimi")
void fun(int) {}

void main()
{
    auto t =  __traits(getAttributes, fun);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
