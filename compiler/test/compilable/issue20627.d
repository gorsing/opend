/**
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/issue20627.d(38): Deprecation: `shared static` constructor can only be of D linkage
compilable/issue20627.d(39): Deprecation: `shared static` destructor can only be of D linkage
compilable/issue20627.d(40): Deprecation: `static` constructor can only be of D linkage
compilable/issue20627.d(41): Deprecation: `static` destructor can only be of D linkage
compilable/issue20627.d(55): Deprecation: `shared static` constructor can only be of D linkage
compilable/issue20627.d(56): Deprecation: `shared static` destructor can only be of D linkage
compilable/issue20627.d(57): Deprecation: `static` constructor can only be of D linkage
compilable/issue20627.d(58): Deprecation: `static` destructor can only be of D linkage
compilable/issue20627.d(63): Deprecation: `shared static` constructor can only be of D linkage
compilable/issue20627.d(64): Deprecation: `shared static` destructor can only be of D linkage
compilable/issue20627.d(65): Deprecation: `static` constructor can only be of D linkage
compilable/issue20627.d(66): Deprecation: `static` destructor can only be of D linkage
---
*/

// OK, default linkage
shared static this () {}
shared static ~this () {}
static this () {}
static ~this () {}

// Still okay
extern(D)
{
    shared static this () {}
    shared static ~this () {}
    static this () {}
    static ~this () {}
}

// No!
extern(C)
{
    shared static this () {}
    shared static ~this () {}
    static this () {}
    static ~this () {}
}

// Disabled because platform specific
version (none) extern(Objective-C)
{
    shared static this () {}
    shared static ~this () {}
    static this () {}
    static ~this () {}
}

extern(C++)
{
    shared static this () {}
    shared static ~this () {}
    static this () {}
    static ~this () {}
}

extern(System)
{
    shared static this () {}
    shared static ~this () {}
    static this () {}
    static ~this () {}
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
