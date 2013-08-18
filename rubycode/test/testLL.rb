require 'test/unit'
require '../linkedlist'
require '../node'
require '../person'

class TestLL < Test::Unit::TestCase
  def test_operations
    names=["apple", "baby", "carrot", "dog", "elephant", "fig", "grass", "horse", "ink"]
    age=20
    i=0
    list=LinkedList.new(nil)
    names.each { |name|
      n=Node.new(Person.new(name, age+i), nil)
      puts "Is empty?:"+list.empty?().to_s()
      list.insert(n)
      i+=1
      puts "List Size now:"+list.size().to_s
    }
    puts "traversing.."
    #list.traverse()
    puts "deleting...."
    while(list.size>0)
      nodem = list.delete()
      puts "From while loop",nodem.data.to_str if nodem!=nil
    end
    puts "...InsertingAt....."
    list1=LinkedList.new(nil)
    names=["apple1", "baby1", "carrot1", "dog1", "elephant1", "fig1", "grass1", "horse1", "ink1"]
    age=20
    #pos=1
    for pos1 in 1..5
      puts "pos.... #{pos1}"
      n=Node.new(Person.new(names[pos1-1], age), nil)
      #puts "Before insert size: #{list1.size} to pos #{pos1}"
      list1.insertAt(n,pos1)
      #puts "Inserted node #{n} at pos #{pos1} and new size is #{list1.size}"
      pos1+=1
    end
    #puts "traversing List1.....#{list1.size}"
    #list1.traverse()
    puts "#################################################################"
    for name in names[5..names.length-1] do
      puts "#####pos.... #{pos1} and name #{name}"
      n=Node.new(Person.new(name, age), nil)
      puts "Before insert size: #{list1.size} to pos #{pos1}"
      list1.insertAt(n,pos1)
      puts "Inserted node #{n} at pos #{pos1} and new size is #{list1.size}"
      pos1-=1
    end
    puts "traversing List1.....#{list1.size}"
    #list1.traverse()
    nl=["ze","yak","um","not"]
    after=["apple1","dog1","fig1","dumbo"]
    i=0
    for i in 0..4 do
      n=Node.new(Person.new(nl[i],20),nil)
      list1.insertAfter(n,after[i])
    end
    puts "traversing List1.....#{list1.size}"
    list1.traverse()
    puts "delete node wjith some data"
    list1.deleteNode("fig1")
    list1.deleteNode("dumbo")
    list1.deleteNode("dog1")
    list1.deleteNode("um")
    list1.deleteNode("apple1")
    list1.traverse()
    puts "**************"
    puts list1.getfirst().data.to_str
    puts list1.getlast().data.to_str
    puts "Delete at 0: #{list1.deleteFrom(0)}"
    puts "Delete at 1: #{list1.deleteFrom(1)}"
    puts "Delete at size #{list1.size}: #{list1.deleteFrom(list1.size)}"
    puts "Delete at 2: #{list1.deleteFrom(2)}"
    puts "Delete at #{list1.size()-1}: "
    puts "#{list1.deleteFrom(list1.size()-1)}"
    puts "Delete at 3: #{list1.deleteFrom(3)}"
    puts "Delete at size #{list1.size}: #{list1.deleteFrom(list1.size)}"
    puts "Delete at size #{list1.size}: #{list1.deleteFrom(list1.size)}"
    puts "Delete at 1: #{list1.deleteFrom(1)}"
    list1.traverse()
    #puts list1.getfirst().data.to_str
    #puts list1.getlast().data.to_str

  end

end        #class end