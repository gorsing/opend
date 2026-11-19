// REQUIRED_ARGS: -dw

/*
TEST_OUTPUT:
---
compilable/deprecated6760.d(13): Deprecation: `deprecated6760.Foo.opEquals` cannot be annotated with `@disable` because it is overriding a function in the base class
compilable/deprecated6760.d(18): Deprecation: `deprecated6760.Bar.opEquals` cannot be marked as `deprecated` because it is overriding a function in the base class
---
*/

class Foo
{
    @disable override bool opEquals(Object);
}

class Bar
{
    deprecated override bool opEquals(Object);
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
