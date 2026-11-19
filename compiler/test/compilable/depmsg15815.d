// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/depmsg15815.d(23): Deprecation: template `depmsg15815.Alias(T)` is deprecated - message
Foo
---
*/

template Unqual(T)
{
    static if (is(T U == const U)) alias Unqual = U;
    else alias Unqual = T;
}

deprecated("message")
template Alias(T)
{
    alias Alias = Unqual!T;
}

struct Foo {}
pragma(msg, Alias!(const(Foo)));

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
