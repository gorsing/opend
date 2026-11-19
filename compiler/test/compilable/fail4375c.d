// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375c.d(15): Warning: else is dangling, add { } after condition at compilable/fail4375c.d(11)
---
*/

void main() {
    if (true)
        if (false) {
            assert(6.1);
        }
    else {
        assert(6.2);
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
