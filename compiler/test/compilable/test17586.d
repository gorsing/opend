/* REQUIRED_ARGS: -o- -dw
TEST_OUTPUT:
---
compilable/test17586.d(13): Deprecation: `test17586.D.foo` is overriding the deprecated method `test17586.C.foo`
---
*/

class C{
    deprecated void foo(){}
}

class D : C{
    override void foo(){}
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
