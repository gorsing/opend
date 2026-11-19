/* https://issues.dlang.org/show_bug.cgi?id=23135
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/fail23135.d(16): Deprecation: overriding `extern(C++)` function `fail23135.C23135.func()` with `const` qualified function `fail23135.Fail23135.func() const` is deprecated
compilable/fail23135.d(16):        Either remove `override`, or adjust the `const` qualifiers of the overriding function type
---
*/
extern(C++) class C23135
{
    void func() { }
}

extern(C++) final class Fail23135 : C23135
{
    override void func() const { }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
