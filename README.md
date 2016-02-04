![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

## Ruby Hashes

The Ruby Hash class implements a "data structure" that provides a
collection of key-value pairs. The keys are used to 'index', or find,
the value associated with the value.

## Objectives

By the end of this, students should be able to:

- Constrast Ruby Hashes with JavaScript dictionaries.
- Create a Ruby Hash using both the implicit (`{}`) and `new` constructors.
- Assign a value to or modify a value in a Ruby Hash using a specified key.
- Access a value in a Ruby Hash using a specified key.
- Obtain an Array of keys from a Ruby Hash.
- Explain why Symbols are preferred over Strings as keys in a Ruby Hash.


## Ruby Symbols

Ruby has a data type, [Symbol](http://ruby-doc.org/core-2.2.0/Symbol.html). As symbol is basically a *immutable* String object. **It's a String object that can not be changed**

We use Ruby Symbols to save memory. So that we don't need to create a new String object if the value is the same. 

For example: 

```ruby

# Creates a new String object
str1 = "joe"
# Creates another String object, even tho the value is the same!
str2 = "joe"

# Creates a immutable string, a Symbol
:joe 

# Now we can use this without creating a new Object
```

Symbols are most often used as keys in Hashes.

## Ruby Hash

#### Simple Hashes

> Create a file `demo/stooges.rb` and run it.

```ruby 
# Create an empty hash
stooges = {}

# The hash will have entries, or key-value pairs
stooges = {
  moe: "Moe Howard", # This is one entry with a key of the symbol :moe,
  #   the and a value of the string "Moe Howard"
  larry: "Larry Fine",
  curly: "Curly Howard"
}
puts stooges

# In pre Ruby 1.9 we had to use the hashrocket
# '=>' 
stooges = {
  :moe =>  "Moe Howard", # This is one entry with a key of the symbol :moe,
  #   the and a value of the string "Moe Howard"
  :larry => "Larry Fine",
  :curly => "Curly Howard"
}

puts stooges

# Need to use the hashrocket syntax when the keys
# are not Ruby symbols.

# Just get the value for the key :larry
puts stooges[:larry]

# Added an entry, key/value pair, for joe
stooges[:joe] = "Joe Smoe"
puts stooges

# show all the keys in the Hash
puts stooges.keys

# What type or class does the method keys return?
puts stooges.keys.class

# Array#keys syntax used in Ruby to denote an
# instance method of a class

# Delete Joe, hated em anyways
stooges.delete(:joe)

puts stooges   # 

# Iterate thru each entry in the Hash
# and spit out a key and a value.
stooges.each do |key, value|
  puts "k/v = #{key}/#{value}"
end

# NOTE that a value can be any type, or Ruby class
stooges[:ages] = [32, 28, 44]
puts stooges

# Whats Larry's age?
larry_age = stooges[:ages][1]
puts "Larry is  #{larry_age} years old"

# Add address for stooges
# Each address is a Hash that has entries for
# a street, city and country
stooges[:larry] = {
  street: "33 Main st",
  city: "Boston",
  country: "US"
}

puts "Larry is #{stooges[:larry]}"
puts "Larry lives in the city of #{stooges.fetch(:larry).fetch(:city)}"
puts "Larry lives in the city of #{stooges[:larry].fetch(:city)}"

# this look the easiest
puts "Larry lives in the city of #{stooges[:larry][:city]}"
```

### You Do 

Write a program in the file `demo/gen_stooges.rb` that will:    

* Create 3 stooges by:  
	1. Prompt the user for a stooge's name,like "Larry Fine".  
	2. Create a hash entry for each stooge where:  
		* The key is the stooge's first name. This key must be a Ruby symbol.  
		* The value is the full name of the stooge.  
	3. Show/print the stooges hash generated.
* Show all the keys.
* Show all the values
* Remove one of the stooges and print the stooges.
* Is the hash empty?
* If not clear the hash.

#### Complex Hashes

> Lets create some nested data structures, Arrays and Hashes in `demo/complex_hashes.rb`.


```ruby
# Need more info about the stooges!!
#stooges = {curly: "Curly Howard", larry: "Larry Howard", moe: 'Moe Howard' }

# Each stooge should be it's own hash, at least, right?
stooges = [
   {
    name: "Curly Howard",
    age: 23,
    address: "33 Main St, Boston, MA"
  },
  {
    name: "Larry Howard",
    age: 35,
    address: "15 Porter St, Cambridge, MA"
  },
  {
    name: "Moe Howard",
    age: 44,
    address: "23 Elm St, Lowell, MA"
  }
]


puts "Stooges are #{stooges}"

# Show all the stooges
stooges.each do |stooge|
  puts "Howdy #{stooge[:name]}, so you are #{stooge[:age]} yrs old"
end


# The first stooge hash
first_stooge = stooges.first
puts "First stooge"
# Hash#each
first_stooge.each do |k, v|
  puts "#{k}: #{v}"
end

# Hash#select. Returns the entry/key-pair
puts "Which stooge is 44? "
older_stooges =  stooges.select{ |stooge| stooge[:age] == 44}
puts "Found #{older_stooges.size} stooges that are 44"
puts "First #{older_stooges.first} that is 44"

puts "First Older Stooge is"
first_older = older_stooges.first
first_older.each do |key, value|
  puts "#{key}: #{value}"
end
```

### You Do

Modify the file `lab/employment_lab.rb`. The directions are in the comments.  
Finished version is in `employment_lab_done.rb`.  

### Hash#fetch (Advanced)
* Used to cause an error where you initially get a non-existent key/entry.
* And to set a default value for an key from a hash.
* Work thru `hash_fetch.rb`
