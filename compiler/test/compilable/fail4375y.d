// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375y.d(16): Warning: else is dangling, add { } after condition at compilable/fail4375y.d(11)
---
*/

static if (true)
    align(1)
        extern(C)
            pure
                static if (false)
                    void G10(){}
else
    void G11(){}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
