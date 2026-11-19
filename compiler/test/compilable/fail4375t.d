// REQUIRED_ARGS: -wi -unittest
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375t.d(14): Warning: else is dangling, add { } after condition at compilable/fail4375t.d(11)
---
*/

unittest {  // disallowed
    if (true)
        if (false)
            assert(52);
    else
        assert(53);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
