// REQUIRED_ARGS: -wi
// https://issues.dlang.org/show_bug.cgi?id=4375: Dangling else
/*
TEST_OUTPUT:
---
compilable/fail4375h.d(16): Warning: else is dangling, add { } after condition at compilable/fail4375h.d(13)
---
*/

void main() {
    switch (4) {
        default:
            if (true)   // disallowed
                if (false)
                    assert(48);
            else
                assert(49);
            break;
    }
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
