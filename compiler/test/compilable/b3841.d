// REQUIRED_ARGS: -wi -o-

/*
TEST_OUTPUT:
---
compilable/b3841.d-mixin-30(30): Warning: `char += float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `int += float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `long += double` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `char -= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `int -= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `long -= double` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `char *= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `int *= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `long *= double` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `char /= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `int /= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `long /= double` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `char %= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `int %= float` is performing truncating conversion
compilable/b3841.d-mixin-30(30): Warning: `long %= double` is performing truncating conversion
---
*/


void f(string op, LHS, RHS)()
{
    // pragma(msg, LHS, " += ", RHS);
    LHS a;
    RHS b;
    mixin("a "~op~" b;");
}

template Ops(T...)
{
    alias Ops = T;
}

void main()
{
    foreach (string op; Ops!("+=", "-=", "*=", "/=", "%="))
    {
        // OK
        f!(op, int, int)();
        f!(op, long, int)();
        f!(op, long, short)();
        f!(op, float, long)();
        f!(op, double, float)();

        // Should that really be OK ?
        f!(op, short, int)();
        f!(op, float, double)();

        // Not OK, truncating conversion.
        f!(op, char, float)();
        f!(op, int, float)();
        f!(op, long, double)();
    }

    // OK
    f!("^^=", int, int)();
    f!("^^=", long, int)();
    f!("^^=", long, short)();
    f!("^^=", float, long)();
    f!("^^=", double, float)();
    // Should that really be OK ?
    f!("^^=", float, double)();
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
