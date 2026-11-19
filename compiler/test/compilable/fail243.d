// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail243.d(27): Deprecation: class `fail243.DepClass` is deprecated
compilable/fail243.d(28): Deprecation: struct `fail243.DepStruct` is deprecated
compilable/fail243.d(29): Deprecation: union `fail243.DepUnion` is deprecated
compilable/fail243.d(30): Deprecation: enum `fail243.DepEnum` is deprecated
compilable/fail243.d(31): Deprecation: alias `fail243.DepAlias` is deprecated
compilable/fail243.d(27): Deprecation: class `fail243.DepClass` is deprecated
compilable/fail243.d(28): Deprecation: struct `fail243.DepStruct` is deprecated
compilable/fail243.d(29): Deprecation: union `fail243.DepUnion` is deprecated
compilable/fail243.d(30): Deprecation: enum `fail243.DepEnum` is deprecated
---
*/

deprecated
{
    class DepClass {}
    struct DepStruct {}
    union DepUnion {}
    enum DepEnum { A }
    alias int DepAlias;
    //typedef int DepTypedef;
}

void func(DepClass obj) {}
void func(DepStruct obj) {}
void func(DepUnion obj) {}
void func(DepEnum obj) {}
void func(DepAlias obj) {}
//void func(DepTypedef obj) {}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
