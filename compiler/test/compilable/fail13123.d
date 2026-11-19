// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail13123.d(10): Deprecation: `fail13123.test`: `in` contract may throw but function is marked as `nothrow`
compilable/fail13123.d(10): Deprecation: `fail13123.test`: `out` contract may throw but function is marked as `nothrow`
---
*/

void test() nothrow
in
{
    throw new Exception(null);
}
out
{
    throw new Exception(null);
}
do
{
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
