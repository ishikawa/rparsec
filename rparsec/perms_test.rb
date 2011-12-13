require_relative 'perms'
require 'test/unit'

include RParsec 

class TestPTree < Test::Unit::TestCase

  def test_add_elem_should_add_new_branch_to_tree
    ptree = PTree.new()
    ptree.add "elem"
 
    assert ptree.choice.first.kind_of? Branch
    assert_equal ptree.choice.length, 1
  end

  def test_add_elems_should_add_collection_of_elements_to_tree
    ptree = PTree.new
    elems = ["elem1", "elem2", "elem3"]
    ptree.add_elems elems
    
    assert_equal 3, ptree.num_elems
  end 

  def test_num_elems_should_return_the_number_of_elements_in_a_tree
    ptree = PTree.new
    ptree.add "elem1"
    ptree.add "elem2"
    ptree.add "elem3"

    assert_equal 3, ptree.num_elems()
  end 
     

end 
