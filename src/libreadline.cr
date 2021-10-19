@[Link("readline")]
{% if flag?(:openbsd) %}
  @[Link("termcap")]
{% end %}
lib LibReadline
  alias Int = LibC::Int

  fun readline(prompt : UInt8*) : UInt8*
  fun add_history(line : UInt8*)
  fun rl_bind_key(key : Int, f : Int, Int -> Int) : Int
  fun rl_unbind_key(key : Int) : Int

  alias CPP = (UInt8*, Int, Int) -> UInt8**

  $rl_attempted_completion_function : CPP
  $rl_line_buffer : UInt8*
  $rl_point : Int
  $rl_done : Int

  $rl_library_version : LibC::Char*

  $rl_instream : FILE*
  $rl_outstream : FILE*

  # The following is defined in libc, but there are no bindings in stdlib and
  # we don't want to pollute the global LibC namespace.
  alias FILE = Void*
  fun fdopen(fildes : Int, mode : LibC::Char*) : FILE*
end
