// https://issues.dlang.org/show_bug.cgi?id=21443
// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/test21443.d(14): Deprecation: `return` statements cannot be in `scope(failure)` bodies.
compilable/test21443.d(14):        Use try-catch blocks for this purpose
---
*/

ulong get () @safe nothrow
{
    scope (failure) return 10;
    throw new Error("");
}

void main () @safe
{
    assert(get() == 10);  // passes
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
