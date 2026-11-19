// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375m.d(15): Warning: else is dangling, add { } after condition at compilable/fail4375m.d(12)
---
*/

void main() {
    do
        if (true)
            if (true)
                assert(76);
        else
            assert(77);
    while (false);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
