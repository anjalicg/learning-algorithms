require 'test/unit'
class Stack
  attr_accessor :top, :bottom, :next
  def initalize(top)
    raise TypeError, "Top should be a Node object" if top.class()!="Node"
    @top=top
  end
end
  class TestStack < Test::Unit::TestCase
    def test_stack()
    end
    
  end
  
