/*
REQUIRED_ARGS: -dw -dip25
TEST_OUTPUT:
---
Deprecation: `-dip25` no longer has any effect
---
*/

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
