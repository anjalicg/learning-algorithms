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
