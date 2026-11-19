/*
EXTRA_FILES: imports/imp19661.d imports/test19107a.d imports/test19107b.d
TEST_OUTPUT:
---
fail_compilation/imports/test19107b.d(3): Error: from file test19107a.d must be imported with 'import imports.test19107a.d;'
---
*/

// https://issues.dlang.org/show_bug.cgi?id=19107

import imports.test19107b;

void all(alias pred, T)(T t)
    if (is(typeof(I!pred(t))))
{ }

void main(string[] args)
{
    args.all!(c => c);
}
