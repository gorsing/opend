// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail18417.d(11): Deprecation: `const` postblit is deprecated. Please use an unqualified postblit.
compilable/fail18417.d(12): Deprecation: `immutable` postblit is deprecated. Please use an unqualified postblit.
compilable/fail18417.d(13): Deprecation: `shared` postblit is deprecated. Please use an unqualified postblit.
---
*/

struct A { this(this) const {} }
struct B { this(this) immutable {} }
struct C { this(this) shared {} }

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
