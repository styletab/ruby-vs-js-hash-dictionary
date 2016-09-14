# Lab: Hash.new Initialized With Default
#
# If you noticed during the demo above, we were able to add a default value
# of an empty string to the consultant hash using consultant.default = ''.
#
# What if we wanted to instantiate our new hash with this default right off
# the bat? Checkout the Ruby docs on new hashes with default blocks.
#
# Then, in bin/lab.rb initialize a new hash using Hash.new with a block that
# sets the default value (without using .default) of all keys to the string
# "Sorry, <keyname> does not exist".


labb = Hash.new { |hash, key| "Sorry, #{key} does not exist." }
=> {}
[15] pry(main)> labb[:e]
=> "Sorry, e does not exist."
[16] pry(main)> labb
=> {}

# we're assiging the hash, labb, and its default assignment so when we pass through
# f it will return the default message, but the hash will remain an empty hash, until
# a key is passed into it.
