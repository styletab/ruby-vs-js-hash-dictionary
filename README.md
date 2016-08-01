![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Ruby Hashes (versus JavaScript dictionaries)

## Instructions

Fork, clone, branch (training), `bundle install`

## Objectives

By the end of this, students should be able to:

-   Constrast Ruby Hashes with JavaScript dictionaries.
-   Create a Ruby Hash using both the implicit (`{}`) and `new` constructors.
-   Assign a value to or modify a value in a Ruby Hash using a specified key.
-   Access a value in a Ruby Hash using a specified key.
-   Obtain an Array of keys from a Ruby Hash.
-   Explain why Symbols are preferred over Strings as keys in a Ruby Hash.

## Introduction

In Ruby, "A Hash is a dictionary-like collection of unique keys and their
 values".  In sharp contrast to JavaScript,
[Ruby Hashes](http://ruby-doc.org/core-2.3.0/Hash.html) are not the most general
 object in the language, but are instances of a specialized class for key/value
 storage.

## Ruby Symbols

A [Symbol](http://ruby-doc.org/core-2.3.0/Symbol.html) is a sequence of
 characters that is stored at most once in any instance of the Ruby interpreter.

In Ruby, strings are compared a character at a time, but symbols are compared by
 `object_id`.  This makes comparing symbols fast and therefore much more
 performant than strings when used as keys in a `Hash`.

### Demo: Test Equivalency

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

We can create a symbol with arbitrary characters if we surround the characters
 with quotes (either `:'<characters>'` or `'<characters>'.to_sym`):

```ruby
> :'&foo'.equal? '&foo'.to_sym
=> true
```

How does this compare to keys in JavaScript?

## Creating Ruby Hashes

Let's look at different ways to create a Hash.

### Demo: Hash Creation

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
> consultant = { given_name: 'Lauren', surname: 'Fazah', height: 67}
=> {:given_name=>"Lauren", :surname=>"Fazah", :height=>67}
> consultant[:weight] += 10
NoMethodError: undefined method ``+'' for nil:NilClass
from (pry):2:in ``__pry__''
> consultant = Hash.new(0).merge({ given_name: 'Lauren', surname: 'Fazah', height: 67})
=> {:given_name=>"Lauren", :surname=>"Fazah", :height=>67}
> consultant[:weight] += 10
=> 10
```

Picking sensible defaults may not always be easy.

### Code Along: Hash::new

Let's use the different forms of [Hash::new](http://ruby-doc.org/core-2.2.4/Hash.html#method-c-new)
to create some hashes in `bin/code_along.rb`.

### Lab: Hash Shorthand

In [bin/lab.rb](bin/lab.rb) create a hash using the shorthand syntax for
assigning the keys `:education` and `:experience` with the string "GA WDI".
Then assign a default of `[]` to the hash and make sure that accessing
 non-existing keys return the default.

## Assigning and Accessing Elements in a Ruby Hash

### Demo: Assigning and Accessing

```ruby
> consultant[:weight]
=> 0
> consultant[:weight] = 185
=> 185
> consultant[:weight] += 5
=> 190
> consultant[:surname]
=> "Fazah"
> consultant[:surname].prepend 'O\''
=> "O'Fazah"
> consultant[:surname]
=> "O'Fazah"
```

### Lab: Appending

Append `" Boston"` to both `:experience` and `:education` in the hash in
[bin/lab.rb](bin/lab.rb).  Append one or more item of your choosing to the
values at each of these keys.

### Demo: Hash Keys

To get an Array of the keys that have been set in a hash, use `Hash#keys`.

```ruby
> consultant.keys
=> [:given_name, :surname, :height, :weight]
```

### Lab: Hash.new Initialized With Default

If you noticed during the demo above, we were able to add a default value of
an empty string to the `consultant` hash using `consultant.default = ''`.

What if we wanted to instantiate our new hash with this default right off the
 bat? Checkout the Ruby docs on [new hashes with default blocks](http://ruby-doc.org/core-2.3.0/Hash.html#new-method).

Then, in `bin/lab.rb` initialize a new hash using `Hash.new` with a block that
 sets the default value (without using `.default`) of all keys to the string
`"Sorry, <keyname> does not exist".`

## [License](LICENSE)

Source code distributed under the MIT license. Text and other assets copyright
General Assembly, Inc., all rights reserved.
