# 1.2 The Send method
x = [1,2,3]
x.send :[]=,0,2
#puts x[0] + x.[](1) + x.send(:[],2)


# 1.4 Regular expression
movies = [%q{"Aladdin",   "G"},
              %q{"I, Robot", "PG-13"},
              %q{"Star Wars","PG"}]

#regexp = /"([^"]+)",\s*"([^"]+)"/
#regexp = /"(.*)",\s*"(.*)"/
#regexp = /"(.*)", "(.*)"/
regexp = /(.*),\s*(.*)/

movies.each do |movie|
      movie.match(regexp)
      title,rating = $1,$2
    # => for first entry, title should be Aladdin, rating should be G, WITHOUT the double 
    # => quotes
print $1
print " : "
print $2
print "\n"
    end

# 1.11 String method
#
s = "Hello: I`m a l33t programmer!!"
print s.split(/[^a-zA-Z]/).reject{|e| e == "I" || e.empty?}
print "\n"
print s.split(/[^a-zA-Z]/).reject{|e| e == "I"}
print "\n"
print s.scan(/[a-zA-Z]/).reject{|e| e == "I" || e.empty?}
print "\n"
print s.split(/[^a-z^A-Z]/).reject{|e| e == "I"}
print "\n"

# 1.12 Iterators
def mystery_sequence(start1, start2, limit=4)
  yield start1
  yield start2
  nextval = start1 + start2
  1.upto(limit) do
    yield nextval
    nextval, start2 = nextval + start2, nextval
  end
end

s = []
mystery_sequence(2,3) do |elt| ; s<<elt; end
print s
print "\n"
# Non #mystery_sequence(2,3).each do |elt| ; s<<elt; end
# Non #mystery_sequence(2,3).do |elt| ; s<<elt; end
# Non #mystery_sequence.each(2,3) do |elt| ; s<<elt; end

# 1.5 Inheritance
#
# 1.8 Attribute Accessor
class Book
  attr_accessor :author
  attr_reader :title
  attr_writer :comments
  def initialize(author, title)
    @author = author
    @title = title
    @comments = []
  end
end

book = Book.new("Chuck Palahniuk", "Fight Club")
puts "Book Class :"
print "#{book.title} was written by #{book.author}"
# Non # book.comments << "#{book.title} was a good book"
# Non # book.comments.each { |comment| puts comment}
# Non # book.title = "Cooking Club"
#
# 1.6 Regular expression 2
# Oui # regexp = /(^[ACGU]+$|^[AGCT]+$)/
# Non # regexp = /^[ACGUT]+$/
# Non # regexp = /^[(ACGU)|(ACGT)]+$/
# Non # regexp = /^([ACG]|[TU])+$/

print "UACGT".match(regexp)
print "\n"

