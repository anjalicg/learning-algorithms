class Person
  attr_accessor :name, :age
  def initialize(name, age)
    @name=name
    @age=age
  end
  
  def to_str()
    return "From to_str Id:"+self.to_s+", Name: "+@name+", Age:"+@age.to_s
  end
  
end
