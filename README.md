# Injectable

Simple and powerfull injection with automatic setters for initialized variables and dependencies.

Very usefull if you have a lot of collaborators and you need to pass objects to them, rather than doing it manually follow the convetion below.

## Installation

Add this line to your application's Gemfile:

    gem 'injectable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install injectable

## Usage

```ruby

  class SomeCollaboratorClass
    def initialize(variable)
      @variable = variable
    end

    attr_reader :variable
  end

  class DummyClass
    include Injectable::Initializer

    def initialize(variable, other_variable)
      overwrites = {} #can be passed in initializer but they need to be passed first to super or just pass an empty hash
      super(overwrites, variable, other_variable) #variable order is important here
    end

    def defaults
      {
        other_class: SomeCollaboratorClass.new(variable),
        some_class: SomeCollaboratorClass.new(other_variable),
        naked_collaborator: Class.new
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
