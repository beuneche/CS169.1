class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    attr_reader attr_name+"_mem" # create bar_history getter
    class_eval %Q"
           def #{attr_name}=(value)
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                if defined? @#{attr_name}_mem
                  @#{attr_name}_history << @#{attr_name}_mem
                end
                @#{attr_name}_mem = value
            end
    "

  end
end

#print @#{attr_name}_history
class TestClass1
  attr_accessor_with_history :foo
end


obj1 = TestClass1.new

obj1.foo = "x"
obj1.foo = [1,2]
obj1.foo = :z
print obj1.foo_history
puts

