if __FILE__==$0
  require "./node.rb"
end
class Queue
  #The FIFO data structure
  attr_accessor :first, :last, :size
  def initialize(first,last)
    raise TypeError, "first and last should be of type nil or Node" if ((first!=nil and first.class.name!="Node") or (last!=nil and last.class.name!="Node"))
    @first=first
    @last=last
    @size=0
  end
  def add(node)
    #to add node to a queue
    
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
        node=@last
        
      end
      
        
    end
    def size
      return @size
    end
    def traverse
    end
    def search
    end
    def empty?()
      if @size==0 then return true
      else return false
      end
        
    end
      
end
