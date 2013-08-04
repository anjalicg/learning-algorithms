require "test/unit"
require "../person.rb"
require "../node.rb"
class TestNode < Test::Unit::TestCase
  def test_create_no_data
    nilDataNode = Node.new()
    assert_not_nil(nilDataNode)
  end
  def test_create_with_person
    p1 = Person.new("name",20)
    pData = Node.new(p1,nil)
    assert_not_nil(pData)    
  end
  def test_get_parameter_data()
    p1 = Person.new("name",20)
    p1Str = p1.to_str()
    pData1 = Node.new(p1,nil)
    pData1Str=pData1.data.to_str()
    assert(p1Str==pData1Str,"The Data in Node refers to the correct Person object")
  end
  def test_get_parameter_next()
    p1 = Person.new("name",20)
    pData1 = Node.new(p1,nil)
    pData1Next=pData1.next()
    assert(pData1Next==nil,"The Next in this Node is nil")
  end
  
  def test_get_next_parameter_data()
    p1 = Person.new("name",20)
    p1Str=p1.to_str()
    p2 = Person.new("name2",40)
    pData1 = Node.new(p1,nil)
    pData2 = Node.new(p1,pData1)
    nextStr=pData2.next().data().to_str()
    assert(p1Str==nextStr,"The Next Node to this Node refers to the correct Person object")
  end  
end
