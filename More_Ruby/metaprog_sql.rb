module QueryBuilder
  extend self
  def method_missing(method, value)
    column = method.id2name.to_s.sub(/find_by_/, '')
    "SELECT * from #{self.to_s.downcase} where #{column} = #{value};"
  end
end

class Article
  extend QueryBuilder
end

p Article.find_by_id(123)
p Article.find_by_name('Foo')
p Article.find_by_price(12.34)#
