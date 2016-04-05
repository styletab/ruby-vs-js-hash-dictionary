![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Ruby Hashes (versus JavaScript dictionaries)

## Instructions

Fork, clone, branch (training), `bundle install`

## Objectives

By the end of this, students should be able to:

- Constrast Ruby Hashes with JavaScript dictionaries.
- Create a Ruby Hash using both the implicit (`{}`) and `new` constructors.
- Assign a value to or modify a value in a Ruby Hash using a specified key.
- Access a value in a Ruby Hash using a specified key.
- Obtain an Array of keys from a Ruby Hash.
- Explain why Symbols are preferred over Strings as keys in a Ruby Hash.

## Introduction

In Ruby, "A Hash is a dictionary-like collection of unique keys and their values".  In sharp contrast to JavaScript, [Ruby Hashes](http://ruby-doc.org/core-2.3.0/Hash.html) are not the most general object in the language, but are instances of a specialized class for key/value storage.

## Ruby Symbols

A [Symbol](http://ruby-doc.org/core-2.3.0/Symbol.html) is a sequence of characters that is stored at most once in any instance of the Ruby interpreter.

In Ruby, strings are compared a character at a time, but symbols are compared by `object_id`.  This makes comparing symbols fast and therefore much more performant than strings when used as keys in a `Hash`.

### Demonstration

Each of the following pairs of operations are equivalent:

```ruby
> 'bob'.equal? 'bob'
=> false
> 'bob'.object_id == 'bob'.object_id
=> false
> 'bob'.eql? 'bob'
=> true
> 'bob' == 'bob'
=> true
```

But all of the following operations are equivalent:

```ruby
> :bob.equal? :bob
=> true
> :bob.object_id == :bob.object_id
=> true
> :bob.eql? :bob
=> true
> :bob == :bob
=> true

```

We can create a symbol with arbitrary characters if we surround the characters with quotes (either `:'<characters>'` or `'<characters>'.to_sym`):

```ruby
> :'&foo'.equal? '&foo'.to_sym
=> true
```

How does this compare to keys in JavaScript?

## Creating Ruby Hashes

Let's look at different ways to create a Hash.

### Demonstration

```ruby
> consultant = {}
=> {}
> consultant = Hash.new
=> {}
> consultant = Hash.new('')
=> {}
> consultant.default = ''
=> ""
> consultant[:surname]
=> ""
> consultant
=> {}
> consultant = { given_name: 'Antony', surname: 'Donovan', height: 76}
=> {:given_name=>"Antony", :surname=>"Donovan", :height=>76}
> consultant[:weight] += 10
NoMethodError: undefined method ``+'' for nil:NilClass
from (pry):2:in ``__pry__''
> consultant = Hash.new(0).merge({ given_name: 'Antony', surname: 'Donovan', height: 76})
=> {:given_name=>"Antony", :surname=>"Donovan", :height=>76}
> consultant[:weight] += 10
=> 10
```

Picking sensible defaults may not always be easy.

### Code along

Let's use the different forms of [Hash::new](http://ruby-doc.org/core-2.2.4/Hash.html#method-c-new) to create some hashes in `bin/code_along.rb`.

### Lab

In `bin/lab.rb` create a hash using the shorthand syntax for assigning the keys `:education` and `:experience` with the string "GA WDI". Then assign a default of `[]` to the hash and make sure that accessing non-existing keys return the default.

## Assigning and accessing elements in a Ruby Hash

### Demonstration

```ruby
> consultant[:weight]
=> 0
> consultant[:weight] = 185
=> 185
> consultant[:weight] += 5
=> 190
> consultant[:surname]
=> "Donovan"
> consultant[:surname].prepend 'O\''
=> "O'Donovan"
> consultant[:surname]
=> "Donovan"
> consultant[:surname] = consultant[:surname].prepend 'O\''
=> "O'Donovan"
> consultant[:surname]
=> "O'Donovan"
```

To get an Array of the keys that have been set in a hash, use `Hash#keys`.

```ruby
> consultant.keys
=> [:given_name, :surname, :height, :weight]
```

### Code along

A quick look at access and assignment in `bin/code_along.rb`.

### Lab

Append " Boston" to both `:experience` and `:education` in the hash in `bin/lab.rb`.  Append one or more item of your choosing to the values at each of these keys.

### Bonus

In `bin/lab.rb` initialize `Hash.new` with a [block](https://netinlet.com/blog/2014/01/01/fun-with-ruby-hashes/) so that if a key is searched for and does not exist, then it will automatically be placed in the hash with a default value.

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
