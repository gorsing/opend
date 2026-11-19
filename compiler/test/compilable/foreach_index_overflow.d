/*
REQUIRED_ARGS: -dw
TEST_OUTPUT:
---

---
*/

void main()
{
    enum { red, green, blue }
    foreach (int i, color; [red, green, blue]) {} // OK

    int[] arr;
    foreach (int index, element; arr[0 .. 0x8000_0000]) {} // OK
    foreach (int index, element; arr[0 .. 0x8000_0001]) {} // error
    foreach (uint index, element; arr[0 .. 0x1_0000_0000]) {} // OK
    foreach (uint index, element; arr[0 .. 0x1_0000_0001]) {} // error

    int[257] data;
    foreach (ubyte i, x; data[]) {} // error
    foreach (ubyte i, x; data[0..256]) {} // OK
    foreach (byte i, x; data[0..0x81]) {} // error
    foreach (byte i, x; data[0..0x80]) {} // OK
}

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
