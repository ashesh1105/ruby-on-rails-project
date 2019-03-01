p "-5.next: #{-5.next}" # gives -4 as output, which will be a numbwer too
p "9.class: #{9.class}" # will output Integer, which is a class for all the numbers. Note that
# this class used to be Fixnum with earlier versions of Ruby
p "4.54.class: #{4.54.class}"  # Will print Float, which is class for Floating point numbers
p "-3.44.class: #{-3.44.class}" # Same as above, it will be a Float class
# Very large number will be Integer now. It used to be BigNum earlier
p "999999999999999999999999999999999999999999999999999999.class:
#{999999999999999999999999999999999999999999999999999999.class}"

# Notice escaping for " by using backslash here, same like Java
p "\"5\".class: #{"5".class}" # will print String since it is of String class

# Conversion to String and to integer
p "\"5\".to_i: #{"5".to_i}"  # will print number 5
p "\"5\".to_i: #{"5".to_i}"  # will print Integer since "5" is converted to an Integer
p "566.to_s: #{566.to_s}" # will print "566"
p "566.to_s.class: #{566.to_s.class}"  # will print String since 566 is converted to a String
