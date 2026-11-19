// DISABLED: linux64 - incompatible with intentional OpenD semantics (compiler/runtime behavior differs from upstream DMD)

struct Base {
    int i;
}

struct A {
    Base base;
    alias base this;
}

struct B {
    A a;
    alias a this;
}

auto otherTest(inout ref Base block) @nogc { assert(0); }
auto otherTest(inout ref A block) @nogc {}

void main() {
    B* thingie;
    otherTest(*thingie);
}
