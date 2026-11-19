// https://issues.dlang.org/show_bug.cgi?id=22134
/* REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/fail22134.d(12): Deprecation: `this.arr[i]` has no effect
---
*/
struct StackBuffer
{
    auto opIndex(size_t i)
    {
        return arr[i];
    }

private:
    void[] arr;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
