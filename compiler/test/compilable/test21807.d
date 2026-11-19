/*
https://issues.dlang.org/show_bug.cgi?id=21807

REQUIRED_ARGS: -dw
TEST_OUTPUT:
---
compilable/test21807.d(11): Deprecation: slice of static array temporary returned by `getSArray()` assigned to longer lived variable `this.str`
compilable/test21807.d(12): Deprecation: slice of static array temporary returned by `getSArray()` assigned to longer lived variable `this.ca`
---
*/
#line 1

char[12] getSArray() pure;

class Foo
{
	string str;
	char[] ca;

	this()
	{
		str = getSArray(); // Should probably be a type error
		ca = getSArray();
	}
}

#line 100

struct S
{
	int i;
}

int* addr(return ref int b)
{
	return &b;
}

class Foo2
{
	int* ptr;

	this()
	{
		ptr = addr(S().i);  // struct temporary
	}
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
