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
      #puts "empty list"
      @start=node
      @last =node
    else
      #puts "1 or more than 1 element"
      @last.next=node
      @last=node
      @last.next=nil
    end
    @size+=1
    #puts "Start, last and size after inserting node from insert:"
    #print @start, @last, @size, node
    #puts "..."
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
        #puts "Insert@:empty list"
        @start= node
        @last=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size==1 and pos==1
        #first is re-assigned
        #puts "Insert@:first in 1 element"
        node.next=@start
        @start=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size==1 and pos==2
        #last is reassigned
        #puts "Insert@:pos=2 and 1 element list"
        @last.next=node
        @last=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size>1 and pos==1
        #puts "Insert@:pos=2 and 1 element"
        #first is re-assigned
        node=@start.next
        @start=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      elsif @size>1 and pos==@size+1
        #last is re-assigned  and
        #puts "Insert@:last element when more than 1 element"
        @last.next=node
        @last=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      else
        #puts "Insert@:In between"
        current=@start
        while (pos>2)
          current=current.next
          pos-=1
        end
        #puts "Current node is:: #{current}"
        temp=current.next
        current.next=node
        node.next=temp
        #node.next=temp
        #current.next=node
        @size+=1
        #puts "First : #{@start.inspect} and last: #{@last.inspect}"
      end
      return 0
    end
  end

  def insertAfter(node, ndata)
    #Insert node after ndata
    if ndata==nil
      return -1
    else
      current=@start
      while (current!=nil)
        if current.data.to_str.match(ndata)
          puts "Current from insertAfter; #{current.data.name}"
          puts "Found match #{current.data.name} for ndata #{ndata}"
          node.next=current.next
          current.next=node
          @size+=1
          return 0
        else
          current=current.next #if current.next!=nil
        end #match if
      end # while
      puts "ndata #{ndata} not found in list"
      return -1
    end #ndata=nil if
  end

  def deleteFrom(pos)

=begin
    current=@start
    posn=pos
    if pos==1 and @start==nil
      puts "empty element"
      return nil
    elsif pos==1 and @start!=nil
      puts "start element"
      @start=@start.next
      @size-=1
    elsif pos==@size and 
      
      
    else
    while(pos>1)
      current =current.next
      pos-=1      
    end #end while
    current=current.next 
    end
    
=end
      

    if pos>@size or pos<=0
      puts "Invalid pos #{pos}"
      return -1
    elsif pos==1 and @size==1
      #puts "only element in len 1 list"
      @start=nil
      @last=nil
      @size-=1
    elsif pos==1 and @size>1
      #puts "first element of longer list #{@start.data.to_str}"
      @start=@start.next
      @size-=1
      #elsif pos==@size and @size>1
      # puts "last element of list"

    else
      #puts "Middle element of longer list: #{pos}"
      current=@start
      i=pos
      while pos>2 and current!=nil
        current=current.next
        pos-=1
      end #while
      if i==@size
        # puts "Going to make this as last: #{current.data.to_str}"
        current.next=nil
        @last=current
      else
        #puts "Going to delete node next to #{current.data.to_str}"
        temp=current
        current.next=temp.next.next
      end
      @size-=1

    end #pos check
    return 0


  end

  def deleteNode(ndata)
    deleted=false
    if @start.data.to_str.match(ndata) then
      puts "start matches data"
      temp=@start
      @start =@start.next
      temp.next=nil
      deleted=true
      @size-=1
    else
      current=@start
      while current!=nil and current.next!=nil
        if current.next.data.to_str.match(ndata)
          #puts "Match found at node #{current.next.data.to_str}:Going to delete it...."
          deleted=true
          if current.next==@last
            @last=current
            current.next=current.next.next
          else
            current.next=current.next.next
          end

          @size-=1
        end
        current=current.next
      end
    end
    puts "Node not found " if !deleted
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
    #puts "Current traverse #{current.inspect}"
    while current!=nil
      puts current
      puts "Traversing lists.........", current.data.to_str
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