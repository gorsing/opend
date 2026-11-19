/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/array_bool.d(13): Deprecation: assert condition cannot be a string literal
compilable/array_bool.d(13):        If intentional, use `"foo" !is null` instead to preserve behaviour
compilable/array_bool.d(14): Deprecation: static assert condition cannot be a string literal
compilable/array_bool.d(14):        If intentional, use `"foo" !is null` instead to preserve behaviour
---
*/
void main()
{
    assert("foo");
    static assert("foo");

    assert("foo".ptr); // OK
    static assert("foo".ptr); // OK

    enum e = "bar";
    static assert(e); // OK
    assert(e); // OK
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
