/*
REQUIRED_ARGS: -dw -revert=intpromote
TEST_OUTPUT:
---
compilable/fail16997.d(31): Deprecation: integral promotion not done for `~c`, remove '-revert=intpromote' switch or `~cast(int)(c)`
compilable/fail16997.d(32): Deprecation: integral promotion not done for `-c`, remove '-revert=intpromote' switch or `-cast(int)(c)`
compilable/fail16997.d(33): Deprecation: integral promotion not done for `+c`, remove '-revert=intpromote' switch or `+cast(int)(c)`
compilable/fail16997.d(36): Deprecation: integral promotion not done for `~w`, remove '-revert=intpromote' switch or `~cast(int)(w)`
compilable/fail16997.d(37): Deprecation: integral promotion not done for `-w`, remove '-revert=intpromote' switch or `-cast(int)(w)`
compilable/fail16997.d(38): Deprecation: integral promotion not done for `+w`, remove '-revert=intpromote' switch or `+cast(int)(w)`
compilable/fail16997.d(41): Deprecation: integral promotion not done for `~sb`, remove '-revert=intpromote' switch or `~cast(int)(sb)`
compilable/fail16997.d(42): Deprecation: integral promotion not done for `-sb`, remove '-revert=intpromote' switch or `-cast(int)(sb)`
compilable/fail16997.d(43): Deprecation: integral promotion not done for `+sb`, remove '-revert=intpromote' switch or `+cast(int)(sb)`
compilable/fail16997.d(46): Deprecation: integral promotion not done for `~ub`, remove '-revert=intpromote' switch or `~cast(int)(ub)`
compilable/fail16997.d(47): Deprecation: integral promotion not done for `-ub`, remove '-revert=intpromote' switch or `-cast(int)(ub)`
compilable/fail16997.d(48): Deprecation: integral promotion not done for `+ub`, remove '-revert=intpromote' switch or `+cast(int)(ub)`
compilable/fail16997.d(51): Deprecation: integral promotion not done for `~s`, remove '-revert=intpromote' switch or `~cast(int)(s)`
compilable/fail16997.d(52): Deprecation: integral promotion not done for `-s`, remove '-revert=intpromote' switch or `-cast(int)(s)`
compilable/fail16997.d(53): Deprecation: integral promotion not done for `+s`, remove '-revert=intpromote' switch or `+cast(int)(s)`
compilable/fail16997.d(56): Deprecation: integral promotion not done for `~us`, remove '-revert=intpromote' switch or `~cast(int)(us)`
compilable/fail16997.d(57): Deprecation: integral promotion not done for `-us`, remove '-revert=intpromote' switch or `-cast(int)(us)`
compilable/fail16997.d(58): Deprecation: integral promotion not done for `+us`, remove '-revert=intpromote' switch or `+cast(int)(us)`
---
*/

void test()
{
    int x;

    char c;
    x = ~c;
    x = -c;
    x = +c;

    wchar w;
    x = ~w;
    x = -w;
    x = +w;

    byte sb;
    x = ~sb;
    x = -sb;
    x = +sb;

    ubyte ub;
    x = ~ub;
    x = -ub;
    x = +ub;

    short s;
    x = ~s;
    x = -s;
    x = +s;

    ushort us;
    x = ~us;
    x = -us;
    x = +us;
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
