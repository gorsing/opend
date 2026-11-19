/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/enum_function.d(11): Deprecation: function cannot have enum storage class
compilable/enum_function.d(12): Deprecation: function cannot have enum storage class
compilable/enum_function.d(13): Deprecation: function cannot have enum storage class
compilable/enum_function.d(14): Deprecation: function cannot have enum storage class
---
*/
enum void f1() { return; }
enum f2() { return 5; }
enum f3() => 5;
enum int f4()() => 5;

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
