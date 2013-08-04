
class Node
  attr_accessor :data, :next
  #Person p, and Node next
  
  def initialize(p=nil, n=nil)
    @data = p
    @next = n
  end

end
