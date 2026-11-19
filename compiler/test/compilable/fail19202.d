// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail19202.d(11): Deprecation: variable `fail19202.X!().X` is deprecated
---
*/

void main()
{
    auto b = X!();
}

template X()
{
    deprecated enum X = true;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
