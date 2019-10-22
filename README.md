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

## Contributing

1. Fork it (<https://github.com/crystal-lang/crystal-readline/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

