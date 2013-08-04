require "test/unit"
require "../person.rb"
class TestPerson < Test::Unit::TestCase
  #include Person
  
  def test_person_class
    name = "name1"
    age=20
    p = Person.new(name,age)
    assert_not_nil(p,"Person object with 2 arguments is not nil")
    assert_respond_to(p,"to_str")
    assert_respond_to(p,"name=")
    assert_respond_to(p,"age=")
    assert_respond_to(p,"name")
    assert_respond_to(p,"age")
    assert_match(/#{name}.*#{age}/,Person.new(name,age).to_str())
    end
  def test_member_config_functions
    name = "name1"
    age=20
    p = Person.new(name,age)
    assert_equal(name,p.name())
    assert_equal(age,p.age())
    
  end
  
  def test_exception_wrong_arguments
    assert_raise( ArgumentError ) {Person.new(2)}
    assert_raise( ArgumentError ) {Person.new() }
  end
  
  
end
