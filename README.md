# Injectable

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'injectable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install injectable

## Usage

```ruby

  class OtherClass
    def initialize(variable)
      @variable = variable
    end

    attr_reader :variable
  end

  class DummyClass
    include Injectable::Initializer

    def initialize(variable, other_variable, overwrites = {})
      super(overwrites, variable, other_variable)
    end

    def defaults
      {
        other_class: OtherClass.new(variable),
        some_class: OtherClass.new(other_variable)
      }
    end
  end

```




## Contributing

1. Fork it ( http://github.com/andrei-miulescu/injectable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
