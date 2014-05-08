# Define a method sum which takes an array of integers as an argument 
# and returns the sum of its elements. For an empty array it should 
# return zero.
def sum(array_of_integers=[])
    array_of_integers.reduce(0, :+)
end
puts sum([4,5,6,5])

# Define a method max_2_sum which takes an array of integers 
# as an argument and returns the sum of its two largest elements. 
# For an empty array it should return zero. For an array with just 
# one element, it should return that element.
def max_2_sum(array_of_integers=[])
    array_of_integers.sort.reverse.take(2).reduce(0, :+)
end
puts max_2_sum([14,5,16,7])

# Define a method sum_to_n? which takes an array of integers 
# and an additional integer, n, as arguments and returns true 
# if any two distinct elements in the array of integers sum to n. 
# An empty array or single element array should both return false.
def sum_to_n?(array_of_integers=[], add_int)
    array_of_integers.combination(2).to_a.any? {|x| sum(x) == add_int}
end
print sum_to_n?([14,5,16,7,9,11], 30) # => true
print sum_to_n?([14,5,16,7,9,11], 33) # => false
print sum_to_n?([13], 13) # => false
print sum_to_n?([1,0], 1) # => true



