require_relative "perms"
require "test/unit"

class TestPTree < Test::Unit::TestCase

  def test_should_add_new_branch_to_empty_PTree
    ptree = PTree.new()
    ptree.add "elem"
 
    assert ptree.choice.first.kind_of? Branch
    assert_equal ptree.choice.length, 1
  end

end 
