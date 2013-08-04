require 'test/unit'
require "./node.rb"
class Stack
  #@@size=0
  attr_accessor :top
  def empty?()
    if @top==nil
      return true
    else
      return false
    end
  end
  def peek()
    #return the top node
    return @top    
  end
  def search(item)
    #return position of a object from top , if present
  end
  def size()
    return @@size
  end
  def pop()
   # puts "Enter pop"
    if @top==nil
     # puts "empty stack"
      return nil
    end
       
    if @top.next==nil
     # puts "One element left!!"
      node=@top
      @top=nil
      @@size-=1
      return node
    else #not last element
      node=@top
      @top=node.next
      @@size-=1
      return node
    end
  end
  def push(node)
    #puts "entering push"
    #puts node.inspect
    if @top==nil
      @top=node
      @top.next=nil
    else
      if @top.next==nil
        ele=@top
        @top=node
        node.next=ele
      else
        ele=@top
        @top=node
        node.next=ele
      end     
    end    
    #puts size
    @@size+=1
    #puts size
    #puts "exiting push"    
  end
  def traverse()
    nextE=@top
    while(nextE.next!=nil)
      puts nextE.data.to_str
      nextE=nextE.next()
    end
    if nextE.next==nil
      puts nextE.data.to_str
    end    
  end
  
  def initialize(top=nil)
    #puts "Top:"+top.inspect()
    #puts "Top class :::: "+top.class.name
    raise TypeError, "Top should be a Node object" if (top!=nil and top.class().name!="Node")
    @top=top
      @@size=0
  end     
end
  class TestStack < Test::Unit::TestCase
    def test_stack_create_object()
      n1=Node.new(Person.new("name1",20),nil)
      s1=Stack.new(n1)
      assert(s1.top.data.name=="name1")
    end
    def test_stack_throws_exception()
      assert_raise(TypeError){
        s1=Stack.new(Person.new("",-1))
        }
    end
    def test_stack_methods()
      s1=Stack.new(Node.new(Person.new("",-1),nil))
      assert_respond_to(s1,"push")
      assert_respond_to(s1,"pop")
      assert_respond_to(s1,"search")
      assert_respond_to(s1,"empty?")
      assert_respond_to(s1,"traverse")
      assert_respond_to(s1,"size")      
    end     
    def test_stack_operation()
      #will implement a person json and xml file later
      names=["apple","baby","carrot","dog","elephant","fig","grass","horse","ink"]
      age=20
      i=0
      nameStack=Stack.new(nil)
      puts "Is stack empty now?:"+nameStack.empty?().to_s+" size: "+nameStack.size().to_s
      names.each{|name|
        p = Person.new(name,age+i)
        n = Node.new(p,nil)
        i+=1
        nameStack.push(n)
        puts "Pushed #{i}th node. Empty?:"+nameStack.empty?().to_s+" size: "+nameStack.size().to_s
        }
      puts "Traverse Stack"
      nameStack.traverse()
      while(node=nameStack.pop())
        puts node.data.to_str
        puts "Popped a node. Empty?:"+nameStack.empty?().to_s+" size: "+nameStack.size().to_s
      end
      
    end
    
  end
  
