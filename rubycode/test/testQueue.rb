require 'test/unit'
require "../person.rb"
require "../node.rb"
require "../queue.rb"

class TestQueue < Test::Unit::TestCase
  def test_queue_new
    p=Person.new("name",20)
    n=Node.new(p,nil)
    assert_nothing_raised(TypeError){
      q= Queue.new(n,n)
      }
    assert_raise(TypeError){
      q= Queue.new(p,p)
      }
    assert_nothing_raised(TypeError){
      q= Queue.new(nil,nil)
      }
  end
  def test_member_methods()
    q=Queue.new(Node.new(Person.new("name",20),nil),nil)
    assert_respond_to(q,"add")
    assert_respond_to(q,"delete")
    assert_respond_to(q,"search")
    assert_respond_to(q,"size")
    assert_respond_to(q,"traverse")   
  end
  def test_queue_function()
    names=["apple","baby","carrot","dog","elephant","fig","grass","horse","ink"]
    age=20
    i=0
    q=Queue.new(nil,nil)
    names.each{|name|
      n=Node.new(Person.new(name,age+i),nil)
      puts "Is empty?:"+q.empty?().to_s()
      q.add(n)
      i+=1
      }
    
  end
  
  
end
