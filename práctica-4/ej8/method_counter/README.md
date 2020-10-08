# MethodCounter

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/method_counter`. To experiment with that code, run `bin/console` for an interactive prompt.

Esta gema se encarga de contabilizar los métodos llamados por una clase. 

## Installation

```bash
$ gem build method_counter.gemspec
$ gem install method_counter
```

## Usage

Para utilizar la funcionalidad de esta gema en una clase:
```ruby
require 'method_counter'
class MyClass
    include MethodCounter::Countable
     def hi
         puts "Hi!"
     end
     def bye
         puts "Bye!"
     end
     #Se coloca count_invocations_of por cada método que se quiera contabilizar
     count_invocations_of :hi
     count_invocations_of :bye
end

#Main program

m = MyClass.new
m.invoked? :hi 
# => false
m.hola
# Hi! => nil
m.invoked? :hi 
# true
m.invoked :hi 
# 1
m.hola
m.hola
m.invoked :hi 
# 3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

