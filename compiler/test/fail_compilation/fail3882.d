/*
PERMUTE_ARGS: -debug
TEST_OUTPUT:
---
fail_compilation/fail3882.d(23): Error: ignored value of `@mustuse` function call `fail3882.strictlyPure!int.strictlyPure`; prepend a `cast(void)` if intentional
fail_compilation/fail3882.d(38): Error: ignored value of `@mustuse` function call `fail3882.f1`; prepend a `cast(void)` if intentional
fail_compilation/fail3882.d(39): Error: ignored value of `@mustuse` function call `fail3882.f2`; prepend a `cast(void)` if intentional
---
*/
import core.attribute;

/******************************************/
// https://issues.dlang.org/show_bug.cgi?id=3882

@mustuse @safe pure nothrow T strictlyPure(T)(T x)
{
    return x*x;
}

void main()
{
    int x = 3;
    strictlyPure(x);

    // https://issues.dlang.org/show_bug.cgi?id=12649
    auto fp = &strictlyPure!int;
    fp(x);
}

/******************************************/
// bugfix in TypeFunction::purityLevel

@mustuse nothrow pure int f1(immutable(int)[] a) { return 0; }
@mustuse nothrow pure int f2(immutable(int)*  p) { return 0; }

void test_bug()
{
    f1([]);
    f2(null);
}
