class LinkedList
  attr_accessor :start, :size, :last

  def initialize(start)
    #initialize the LinkedList object
    @start=start
    @size=0
    @last=start
#    @current=start
  end

  def empty?
    if @size==0 then
      if @start==nil and @last==nil then
        print "everything is nil"
      end
      return true
    else
      return false
    end
  end

  def insert(node)
    #Inserts at last i.e append to the list
    if @last==nil
      puts "empty list"
      @start=node
      @last =node
    else
      puts "1 or more than 1 element"
      @last.next=node
      @last=node
      @last.next=nil
    end
    @size+=1
    puts "Start, last and size after inserting node from insert:"
    print @start, @last, @size, node
    puts "..."
  end

  def clear()
    #Clears the complete list and
    @start=nil
    @last=nil
    @size=0

  end

  def insertAt(node, pos)
    #Insert node at position pos, pos >=1, pos=1 means start/first element
    #pos=1 -- >first element
    #pos=size--> insert before current last element
    #pos=size+1 -->insert after last element
    #if for pos values , pos=1, pos=size and else for all other pos(in that use next option)
    #puts "position; #{pos}, size #{@size}"
    if pos>size+1 or pos<0
      puts "position does not exist"
      return -1
    else
      if @size==0
        puts "Insert@:empty list"
        @start= node
        @last=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size==1 and pos==1
        #first is re-assigned
        puts "Insert@:first in 1 element"
        node.next=@start
        @start=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size==1 and pos==2
        #last is reassigned
        puts "Insert@:pos=2 and 1 element list"
        @last.next=node
        @last=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size>1 and pos==1
        puts "Insert@:pos=2 and 1 element"
        #first is re-assigned
        node=@start.next
        @start=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size>1 and pos==@size+1
        #last is re-assigned  and
        puts "Insert@:last element when more than 1 element"
        @last.next=node
        @last=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      else
        puts "Insert@:In between"
        current=@start
        while(pos>2)
          current=current.next
          pos-=1
        end
        puts "Current node is:: #{current}"
        temp=current.next
        current.next=node
        node.next=temp
        #node.next=temp
        #current.next=node
        @size+=1
        puts "First : #{@start.inspect} and last: #{@last.inspect}"
      end
      return 0
    end
  end

  def insertAfter(node, node1)
    #Insert node after node1

  end

  def deleteFrom(pos)
    current=@start
    while(pos>0
      
      end
      

  end

  def deleteNode(node1)

  end

  def search(element)
    current=@start
    i=0
    pos=-1
    while (current!=nil)
      if current.data.to_str.match(element) then
        pos=i
        i+=1
        return pos
      end
      if current.next!=nil then
        current=current.next
      else
        current=nil
      end
    end
    return pos

  end

  def traverse
    current=@start
    puts "Current traverse #{current.inspect}"
    while current!=nil
      puts current
      puts "Traversing lists.........",current.data.to_str
      if current.next!=nil
        current=current.next
      else
        current=nil
      end
    end

  end

  def delete()
    #Remove the last node
    node=nil
    current = @start
    while current!=nil and current.next!=nil and current.next.next!=nil
      current =current.next
    end
    if current!=nil and current.next!=nil
      puts "not last element"
      node=current.next
      @last=current
      @last.next=nil
      @size-=1
    elsif current!=nil
      puts "Last element"
      node=current
      @last.next=nil
      @last=nil
      @start=nil
      @size-=1
    else
      puts "empty list"
      #@size-=1
      return nil
    end

    return node
  end

  def getfirst
    return @start

  end

  def getlast
    return @last

  end


end