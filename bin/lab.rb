### Lab: Hash.new Initialized With Default
init_hash = Hash.new{ |hash, key| hash[key] = "Sorry, #{key} does not exist" }
