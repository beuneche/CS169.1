['banana','anana','naan'].map do |food|
  food.reverse
end.select { |f| puts f.match /^a/ }


#['banana','anana','naan'].map do |food|
#  puts food.reverse
#
#end

