#  to declare a hash use one of the two:

developer = Hash.new
developer = {}
puts developer

#  to set the default

developer = Hash.new('')

# to add a symbol to the hash:
developer[:first_name] = 'Christina'

# this will return
=> {:first_name=>"Christina"}

# when I try to call christina it will return the default

[8] pry(main)> developer[:Christina]
=> ""


# adding string to the developer hash

developer[:education] += "Boston"
