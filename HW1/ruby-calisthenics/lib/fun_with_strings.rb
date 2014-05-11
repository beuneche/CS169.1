module FunWithStrings
  def palindrome?
    s = self.downcase.gsub(/\W/, "").squeeze(" ").strip
    s == s.reverse
  end
  def count_words
    frequencies = Hash.new(0)
    words = self.gsub(/\W" "/, "").downcase.split(" ")
    words.each { |word| frequencies[word.gsub(/[^a-z]/, "")] += 1 }
    frequencies.delete_if { |k,v| k.empty? }
  end
  def anagram_groups
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
  #puts "A man, a plan, a canal -- Panama".palindrome?
  #puts "A man, a plan, a canal -- Panama!".count_words
  puts "scream cars for four scar creams".anagram_groups
end
