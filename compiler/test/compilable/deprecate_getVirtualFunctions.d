// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/deprecate_getVirtualFunctions.d(18): Deprecation: `traits(isVirtualFunction)` is deprecated. Use `traits(isVirtualMethod)` instead
compilable/deprecate_getVirtualFunctions.d(19): Deprecation: `traits(getVirtualFunctions)` is deprecated. Use `traits(getVirtualMethods)` instead
---
*/

class A
{
    void fun() {}
}

void main()
{
    auto a = __traits(isVirtualFunction, A.fun);
    foreach(f; __traits(getVirtualFunctions, A, "fun")) {}
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
