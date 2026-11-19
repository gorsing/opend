/*
ARG_SETS: -preview=?
ARG_SETS: -preview=h
TEST_OUTPUT:
----
Upcoming language changes listed by -preview=name:
  =all              Enables all available upcoming language changes
  =dip25            implement https://github.com/dlang/DIPs/blob/master/DIPs/archive/DIP25.md (Sealed references) - enabled by default [DEPRECATED]
  =dip1000          implement https://github.com/dlang/DIPs/blob/master/DIPs/other/DIP1000.md (Scoped Pointers)
  =dip1008          implement https://github.com/dlang/DIPs/blob/master/DIPs/other/DIP1008.md (@nogc Throwable) - unsupported
  =dip1021          https://github.com/dlang/DIPs/blob/master/DIPs/accepted/DIP1021.md
  =bitfields        add C-like bitfields - DO NOT USE
  =nosharedaccess   disable access to shared memory objects
  =in               `in` on parameters means `scope const [ref]` and accepts rvalues
----
*/
