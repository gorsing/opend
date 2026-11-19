// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/depmsg15814.d(9): Deprecation: function `depmsg15814.get15814` is deprecated - bug15814
---
*/
deprecated("bug15814") int get15814() { return 0; }
enum val15814 = get15814();

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
