/* REQUIRED_ARGS: -dw -unittest
TEST_OUTPUT:
---
compilable/fail21830.d(24): Deprecation: struct `fail21830.OldS21830` is deprecated - Deprecated type
compilable/fail21830.d(24): Deprecation: template `fail21830.test21830(T)(T t) if (is(T == OldS21830))` is deprecated - Deprecated template
compilable/fail21830.d(24): Deprecation: struct `fail21830.OldS21830` is deprecated - Deprecated type
---
*/
#line 1
deprecated("Deprecated type")
struct OldS21830 { }

struct NewS21830 { }

static if (1)
{
    auto test21830(T)(T t)
    if (is(T == NewS21830))
    {
        return T.init;
    }
}

deprecated("Deprecated template")
auto test21830(T)(T t)
if (is(T == OldS21830))
{
    return T.init;
}

unittest
{
    auto b = test21830(OldS21830());
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
