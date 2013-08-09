require 'test/unit'
require "../person.rb"
require "../node.rb"
require "../queue.rb"

class TestQueue < Test::Unit::TestCase
  def test_queue_new
    p=Person.new("name", 20)
    n=Node.new(p, nil)
    assert_nothing_raised(TypeError) {
      q= Queue.new(n, n)
    }
    assert_raise(TypeError) {
      q= Queue.new(p, p)
    }
    assert_nothing_raised(TypeError) {
      q= Queue.new(nil, nil)
    }
  end

  def test_member_methods()
    q=Queue.new(Node.new(Person.new("name", 20), nil), nil)
    assert_respond_to(q, "add")
    assert_respond_to(q, "delete")
    assert_respond_to(q, "search")
    assert_respond_to(q, "size")
    assert_respond_to(q, "traverse")
  end

  def test_queue_function()
    names=["apple", "baby", "carrot", "dog", "elephant", "fig", "grass", "horse", "ink"]
    age=20
    i=0
    q=Queue.new(nil, nil)
    names.each { |name|
      n=Node.new(Person.new(name, age+i), nil)
      puts "Is empty?:"+q.empty?().to_s()
      q.add(n)
      i+=1
      puts "Queue Size now:"+q.size().to_s
    }
    puts "Travesing..."
    q.traverse()
    puts "Searching................."
    #puts nameStack.search("apple").to_s
    assert_not_equal(-1, q.search("apple"), "'apple' was found")
    assert_not_equal(-1, q.search("elephant"), "'elephant' was found")
    #puts nameStack.search("elephant").to_s
    assert_equal(-1, q.search("job"), "'Job' was not found")
    #puts nameStack.search("ink").to_s
    assert_not_equal(-1, q.search("ink"), "'ink' was found")
    puts "Test deletion"
    size=q.size
    while (q.size!=0)
      assert_equal(size,q.size)
      q.delete().data.to_str
      size-=1
    end


  end


end
