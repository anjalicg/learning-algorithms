require 'test/unit'
require "./node.rb"
class Stack
  attr_accessor :top
  def empty?()
    if @top==nil
      return true
    else
      return false
    end
  end
  def peek()
    return top()    
  end
  def search(item)
    
    nextE=@top
    i=0
    pos=-1
    while(nextE!=nil)
      if nextE.data.to_str.match(item) then
        puts "Item#{item} found at #{i} position from top:-> "+nextE.data.to_str
        pos=i
        break
      end
        if(nextE.next!=nil)
          nextE=nextE.next()
        else
          nextE=nil
        end
        
        i+=1
    end
      return pos
    
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
    while(nextE!=nil and nextE.next!=nil)
      puts nextE.data.to_str
      nextE=nextE.next()
    end
    if (nextE!=nil and nextE.next==nil)
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
      assert_respond_to(s1,"peek")      
    end     
    def test_stack_operation()
      #will implement a person json and xml file later
      names=["apple","baby","carrot","dog","elephant","fig","grass","horse","ink"]
      age=20
      i=0
      nameStack=Stack.new(nil)
      #puts "Is stack empty now?:"+nameStack.empty?().to_s+" size: "+nameStack.size().to_s
      assert(nameStack.empty?(),"nameStack is empty now")
      assert_equal(0,nameStack.size(),"nameStack Size is 0")
      names.each{|name|
        p = Person.new(name,age+i)
        n = Node.new(p,nil)
        i+=1
        nameStack.push(n)
        #puts "Pushed #{i}th node. Empty?:"+nameStack.empty?().to_s+" size: "+nameStack.size().to_s
        assert(!nameStack.empty?(),"nameStack is NOT empty now")
        assert_equal(i,nameStack.size(),"nameStack Size is #{i}")
        }
      puts "Traverse Stack of size:"+nameStack.size().to_s
      nameStack.traverse()
      puts "Searching................."
      #puts nameStack.search("apple").to_s
      assert_not_equal(-1,nameStack.search("apple"),"'apple' was found")
      assert_not_equal(-1,nameStack.search("elephant"),"'elephant' was found")
      #puts nameStack.search("elephant").to_s
      assert_equal(-1,nameStack.search("job"),"'Job' was not found")
      #puts nameStack.search("ink").to_s
      assert_not_equal(-1,nameStack.search("ink"),"'ink' was found")
      peek=nameStack.peek()
      while(node=nameStack.pop())
        #puts node.data.to_str
        assert_not_nil(node,"Popped not nil")
        assert_equal(peek,node,"Peek and node are to be equal")
        peek=nameStack.peek()
        #puts "Popped a node. Empty?:"+nameStack.empty?().to_s+" size: "+nameStack.size().to_s
        #puts "Peeking at top after pop:"+nameStack.peek().data.to_str if nameStack.peek()!=nil
      end
      puts "Traverse Stack after pop of size:"+nameStack.size().to_s
      nameStack.traverse()
    end
    
  end
  
