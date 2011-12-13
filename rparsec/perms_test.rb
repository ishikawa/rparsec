require_relative 'perms'
require 'test/unit'

include RParsec 

class TestPTree < Test::Unit::TestCase

  def test_add_elem_should_add_new_branch_to_ptree
    ptree = PTree.new()
    ptree.add "elem"
 
    assert ptree.choice.first.kind_of? Branch
    assert_equal ptree.choice.length, 1
  end

end 
