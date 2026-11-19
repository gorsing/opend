// REQUIRED_ARGS: -wi

/*
TEST_OUTPUT:
---
compilable/warn13679.d(13): Warning: cannot use `foreach_reverse` with an associative array
---
*/

void main()
{
    int[int] aa;
    foreach_reverse(k, v; aa) {}
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
