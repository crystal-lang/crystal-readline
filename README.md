# readline

Crystal bindings to [GNU Readline Library](https://www.gnu.org/software/readline).

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     readline:
       github: crystal-lang/crystal-readline
   ```

2. Run `shards install`

## Usage

```crystal
require "readline"

user_input = Readline.readline("> ")
```

## Troubleshooting

### Static linking

If you build your binary with `crystal build --static` you might encounter errors like these:

```
(.text+0x678): undefined reference to `PC'
(.text+0x687): undefined reference to `BC'
(.text+0x68e): undefined reference to `UP'
(.text+0x728): undefined reference to `tgetent'
(.text+0x76f): undefined reference to `tgetstr'
(.text+0x799): undefined reference to `PC'
(.text+0x7af): undefined reference to `BC'
(.text+0x7bd): undefined reference to `UP'
(.text+0x7cf): undefined reference to `tgetflag'
(.text+0x81e): undefined reference to `tgetflag'
(.text+0x938): undefined reference to `tgetflag'
```

In this case you may need to explicitly link to `libtermcap`. Crystal offers the
`--link-flags` option but it doesn't let you specify where to insert the new
flags, and this is order dependent. Luckily, the linker doesn't complain about
duplicate flags, so you can link `libtermcap` like so:

```sh-session
$ crystal build --static --link-flags "-rdynamic -static -lreadline -ltermcap" main.cr
```

## Contributing

1. Fork it (<https://github.com/crystal-lang/crystal-readline/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

