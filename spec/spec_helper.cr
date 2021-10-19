require "spec"
require "../src/readline"

def with_io
  orig_input = Readline.input
  orig_output = Readline.output

  begin
    IO.pipe do |in_read, in_write|
      IO.pipe do |out_read, out_write|
        Readline.input = in_read
        Readline.output = out_write

        yield in_write, out_read

        in_read.close
        out_write.close
      end
    end
  ensure
    Readline.input = orig_input
    Readline.output = orig_output
  end
end
