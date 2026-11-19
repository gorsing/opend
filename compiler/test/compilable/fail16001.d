// REQUIRED_ARGS: -dw
/*
TEST_OUTPUT:
---
compilable/fail16001.d(10): Deprecation: using `(args) => { ... }` to create a delegate that returns a delegate is error-prone.
compilable/fail16001.d(10):        Use `(args) { ... }` for a multi-statement function literal or use `(args) => () { }` if you intended for the lambda to return a delegate.
---
*/
void main() {
	auto fail = () => {};
	auto ok = () => () {};
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
