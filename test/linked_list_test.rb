require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @linked_list
  end

  def test_it_can_append
    assert_instance_of Node, @linked_list.append("West")
    assert_instance_of Node, @linked_list.head
    @linked_list.append("Rhodes")
    @linked_list.append("Smith")
    assert_equal "Rhodes", @linked_list.head.next_node.surname
    assert_equal "Smith", @linked_list.head.next_node.next_node.surname
    assert_equal "West", @linked_list.head.surname
  end

  def test_it_can_count_nodes
    assert_equal 0, @linked_list.count
    @linked_list.append("West")
    assert_equal 1, @linked_list.count
    @linked_list.append("Rhodes")
    assert_equal 2, @linked_list.count
  end

  def test_it_can_return_string_with_family_name
    @linked_list.append("West")
    assert_equal "The West family", @linked_list.to_string
    @linked_list.append("Rhodes")
    assert_equal "The West family, followed by the Rhodes family", @linked_list.to_string
    @linked_list.append("Brooks")
    assert_equal "The West family, followed by the Rhodes family, followed by the Brooks family", @linked_list.to_string
    @linked_list.append("Henderson")
    assert_equal "The West family, followed by the Rhodes family, followed by the Brooks family, followed by the Henderson family", @linked_list.to_string
    @linked_list.append("McKinney")
    assert_equal "The West family, followed by the Rhodes family, followed by the Brooks family, followed by the Henderson family, followed by the McKinney family", @linked_list.to_string
  end

  def test_it_can_prepend
    @linked_list.append("Brooks")
    assert_equal "The Brooks family", @linked_list.to_string
    @linked_list.append("Henderson")
    assert_equal "The Brooks family, followed by the Henderson family", @linked_list.to_string

    @linked_list.prepend("McKinney")
    assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", @linked_list.to_string
    assert_equal 3, @linked_list.count

    @linked_list.insert(1, "Lawson")
    assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", @linked_list.to_string
  end

end
