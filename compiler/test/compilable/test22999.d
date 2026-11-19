/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/test22999.d(18): Deprecation: switch case fallthrough - use 'goto default;' if intended
compilable/test22999.d(25): Deprecation: switch case fallthrough - use 'goto case;' if intended
---
*/

// no switch fallthrough error with multi-valued case
// https://issues.dlang.org/show_bug.cgi?id=22999
void main()
{
    int i;
    switch (0)
    {
        case 0, 1: i = 20;
        default: assert(0);
    }

    switch (0)
    {
        default:
        case 0, 1: i = 20;
        case 2, 3: i = 30;
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
