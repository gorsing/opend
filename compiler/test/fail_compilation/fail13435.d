// https://issues.dlang.org/show_bug.cgi?id=13435

/*
TEST_OUTPUT:
---
fail_compilation/fail13435.d(25): Error: cannot implicitly convert expression `d` of type `int[]` to `S!int`
fail_compilation/fail13435.d(25):        `__ictorcmp2 = d` is the first assignment of `__ictorcmp2` therefore it represents its initialization
fail_compilation/fail13435.d(25):        `opAssign` methods are not used for initialization, but for subsequent assignments
fail_compilation/fail13435.d(25): Error: cannot implicitly convert expression `d` of type `int[]` to `S!int`
fail_compilation/fail13435.d(25):        `this._a = d` is the first assignment of `this._a` therefore it represents its initialization
fail_compilation/fail13435.d(25):        `opAssign` methods are not used for initialization, but for subsequent assignments
---
*/

struct S(T)
{
    void opAssign(T[] arg) {}
}

class B
{
    this(int[] d)
    {
        S!int c;
        _a = d; // Error: cannot implicitly convert expression (d) of type int[] to S!int
        c = d; // compiles OK
    }

    S!int _a;
}
