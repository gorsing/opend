/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/template_function_oop.d(16): Deprecation: a function template is not virtual so cannot be marked `override`
compilable/template_function_oop.d(17): Deprecation: a function template is not virtual so cannot be marked `abstract`
---
*/
class C
{
    void f();
}

class D : C
{
    override void f()() {}
    abstract void g()();
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
