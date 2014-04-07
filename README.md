# Rubyfmt

Ruby port of gofmt.

## Usage

```bash
$ echo 'def hello(who="world");puts "Hello #{who}";end' | ./bin/rubyfmt
```

Outputs:

```ruby
def hello(who = "world")
  puts "Hello #{who}"
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'rubyfmt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubyfmt

## Credits

- seattle.rb - for ruby_parser & ruby2ruby which do _all_ of the heavy-lifting.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rubyfmt/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
