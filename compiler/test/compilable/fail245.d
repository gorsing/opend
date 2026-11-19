// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail245.d(27): Deprecation: variable `fail245.ClassWithDeps.value` is deprecated
compilable/fail245.d(28): Deprecation: variable `fail245.ClassWithDeps.value` is deprecated
compilable/fail245.d(29): Deprecation: variable `fail245.ClassWithDeps.value` is deprecated
compilable/fail245.d(30): Deprecation: variable `fail245.ClassWithDeps.value` is deprecated
compilable/fail245.d(32): Deprecation: variable `fail245.ClassWithDeps.staticValue` is deprecated
compilable/fail245.d(33): Deprecation: variable `fail245.ClassWithDeps.staticValue` is deprecated
compilable/fail245.d(34): Deprecation: variable `fail245.ClassWithDeps.staticValue` is deprecated
compilable/fail245.d(35): Deprecation: variable `fail245.ClassWithDeps.staticValue` is deprecated
compilable/fail245.d(36): Deprecation: variable `fail245.ClassWithDeps.staticValue` is deprecated
compilable/fail245.d(37): Deprecation: variable `fail245.ClassWithDeps.staticValue` is deprecated
---
*/

//import std.stdio;

class ClassWithDeps
{
    deprecated int value;
    deprecated static int staticValue;

    void test(ClassWithDeps obj)
    {
        obj.value = 666;
        this.value = 666;
        auto n1 = obj.value;
        auto n2 = this.value;

        obj.staticValue = 102;
        this.staticValue = 103;
        ClassWithDeps.staticValue = 104;
        auto n3 = obj.staticValue;
        auto n4 = this.staticValue;
        auto n5 = ClassWithDeps.staticValue;
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
