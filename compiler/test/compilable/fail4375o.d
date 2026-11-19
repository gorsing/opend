// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375o.d(15): Warning: else is dangling, add { } after condition at compilable/fail4375o.d(11)
---
*/

void main() {
    if (true)
        for (; false;)
            if (true)
                assert(82);
    else
        assert(83);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
