/*
REQUIRED_ARGS: -dw
EXTRA_FILES: imports/deprecatedImporta.d imports/deprecatedImportb.d

TEST_OUTPUT:
----
compilable/deprecatedImports.d(20): Deprecation: from file deprecatedImporta.d should be imported with 'import deprecatedImporta;'
compilable/imports/deprecatedImporta.d(2): Deprecation: from file deprecatedImportb.d should be imported with 'import deprecatedImportb;'
compilable/deprecatedImports.d(22): Deprecation: alias `deprecatedImporta.foo` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(22): Deprecation: alias `deprecatedImporta.foo` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(24): Deprecation: alias `deprecatedImporta.bar` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(26): Deprecation: alias `deprecatedImporta.AliasSeq` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(30): Deprecation: alias `deprecatedImporta.S` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(32): Deprecation: alias `deprecatedImporta.C` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(34): Deprecation: alias `deprecatedImporta.I` is deprecated - Please import deprecatedImportb directly!
compilable/deprecatedImports.d(28): Deprecation: alias `deprecatedImporta.E` is deprecated - Please import deprecatedImportb directly!
----
*/

import imports.deprecatedImporta;

alias f = foo;

alias b = bar!(int);

alias Types = AliasSeq!(int);

int x = E;

S s;

C c;

I i;

// OpenD: -w/-de are informational aliases for -wi/-dw; compilation succeeds.
// Old DMD semantics: -w made warnings halt compilation, -de made
// deprecations halt compilation. Kept expectation below for reference.
