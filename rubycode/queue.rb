if __FILE__==$0
  require "./node.rb"
end
class Queue
  #The FIFO data structure
  attr_accessor :first, :last, :size

  def initialize(first, last)
    raise TypeError, "first and last should be of type nil or Node" if ((first!=nil and first.class.name!="Node") or (last!=nil and last.class.name!="Node"))
    @first=first
    @last=last
    @size=0
  end

  def add(node)
    #to add node to a queue
    if @first==nil
      puts "empty q"
      @first=node
      @first.next=nil
      @last=@first
    else
      temp=@last
      @last=node
      temp.next=node
    end
    @size+=1
    puts "first node"
    puts @first.data.to_str
    puts "last node"
    puts @last.data.to_str
  end

  def delete()
    node=nil
    if @last==nil and @first==nil
      puts "empty queue"
      return node
    elsif @last==@first
      puts "One element leftqueue"
      node=@last
      @last=nil
      @first=nil
      @size-=1
    else
      puts "more than 1 element left"
      ###
      node=@first
      @first=node.next
      @size-=1
    end
    return node


  end

  def size
    return @size
  end

  def traverse
    #puts "inside q traverse"
    node=@first
    i=1
    while(node!=nil)
      puts "Node #{i} : "+node.data.to_str()
      node=node.next()
      i+=1
    end
  end

  def search(element)
    node=@first
    foundpos=-1
    i=0
    while(node!=nil)
      if(node.data.to_str.match(element)) then
        foundpos=i
      end
      node=node.next()
      i+=1
    end
    return foundpos
  end

  def empty?()
    if @size==0 then
      return true
    else
      return false
    end

  end

end
