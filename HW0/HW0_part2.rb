# Define a method hello(name) that takes a string representing a name 
# and returns the string "Hello, " concatenated with the name.
def hello(name)
    "Hello, " + name
end
#puts hello("Laurent") # => Hello, Laurent


# Define a method starts_with_consonant?(s) that takes a string 
# and returns true if it starts with a consonant and false otherwise. 
# (For our purposes, a consonant is any letter other than A, E, I, O, U.) 
# NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant?(s)
    if s[0] =~ /[a-z]/i
        !!(s =~ /^[^AEIOU](.*)$/i)
    else
        return false
    end
end
#puts starts_with_consonant?("laurent") # => true
#puts starts_with_consonant?('aurent') # => false


# Define a method binary_multiple_of_4?(s) that takes a string and returns 
# true if the string represents a binary number that is a multiple of 4. 
# NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4?(s)
    #print s.class, " : " , s, "\n"
    #print "String RegExp : ", !!(s =~ /^[-+]?[0-1]+$/), "\n"
    #print "String is_a_number ? : ", s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil, "\n"

    if s.is_a? Fixnum
        s.to_i % 4 == 0
    elsif s.is_a? String and s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) != nil
        s.to_i(2) % 4 == 0
    else
        return false
    end
end

puts binary_multiple_of_4?('0000101') # => ?



