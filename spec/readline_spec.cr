require "./spec_helper"

describe Readline do
  it ".version" do
    Readline.version
  end

  it ".input" do
    Readline.input = STDOUT
    Readline.input.should eq STDOUT
  ensure
    Readline.input = STDIN
  end

  it ".output" do
    Readline.output = STDERR
    Readline.output.should eq STDERR
  ensure
    Readline.output = STDOUT
  end

  it ".readline" do
    with_io do |output, input|
      input << "hello\n"
      input.close
      line = Readline.readline("> ")
      line.should eq "hello"
      output.gets(2).should eq "> "
    end
  end

  typeof(Readline.readline("Hello", true))
  typeof(Readline.readline(prompt: "Hello"))
  typeof(Readline.readline(add_history: false))
  typeof(Readline.line_buffer)
  typeof(Readline.point)
  typeof(Readline.autocomplete { |s| %w(foo bar) })

  it "gets prefix in bytesize between two strings" do
    Readline.common_prefix_bytesize("", "foo").should eq(0)
    Readline.common_prefix_bytesize("foo", "").should eq(0)
    Readline.common_prefix_bytesize("a", "a").should eq(1)
    Readline.common_prefix_bytesize("open", "operate").should eq(3)
    Readline.common_prefix_bytesize("operate", "open").should eq(3)
    Readline.common_prefix_bytesize(["operate", "open", "optional"]).should eq(2)
  end
end
