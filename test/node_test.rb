require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new("Burke")
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_it_can_get_surname
    assert_equal "Burke", @node.surname
  end

  def test_starts_with_next_node_as_nil
    assert_nil @node.next_node
  end
end
