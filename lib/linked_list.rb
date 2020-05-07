class LinkedList

  attr_accessor :head

  def initialize
    @head = nil
  end

  def is_empty?
    @head.nil?
  end

  def tail?(given_node)
    given_node.next_node.nil?
  end

  def append(surname)
    if is_empty?
      @head = Node.new(surname)
    else
      append_after_head(surname, @head)
    end
  end

  def append_after_head(surname, given_node)
    if tail?(given_node)
      given_node.next_node = Node.new(surname)
    else
      append_after_head(surname, given_node.next_node)
    end
  end

  def count
    node = @head
    node_count = 0
    until node.nil?
      node_count += 1
      node = node.next_node
    end
    node_count
  end

  def to_string
    node = @head
    string = "The #{head.surname} family"
    until tail?(node)
      node = node.next_node
      string << ", followed by the #{node.surname} family"
    end
    string
  end

  def prepend(surname)
    node = Node.new(surname)
    if is_empty?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def insert(given_position, surname)
    return nil if is_empty?
    node = @head
    (given_position - 1).times do |node|
      node = node.next_node
    end
    new_node = Node.new(surname)
    new_node.next_node = node.next_node
    node.next_node = new_node
  end

  def find(first_position, elements = 1)
    return nil if is_empty?
    node = @head
    first_position.times { node = node.next_node }
    output_string = "The #{node.surname} family"
    until tail?(node) == true || elements == 1
      elements -= 1
      node = node.next_node
      output_string << ", followed by the #{node.surname} family"
    end
    output_string
  end

  def includes?(given_value)
    return false if is_empty? == true
    found_value?(given_value) if is_empty? == false
  end

  #recursion example
  def found_value?(given_value, node = @head)
    return true if node.surname == given_value
    return false if tail?(node)
    found_value?(given_value, node.next_node)
  end

  def pop
    node = @head
    node_count ||= count
    return nil if is_empty?
    return remove_node(node.next_node) if node_count == 1
    (node_count - 2).times { node = node.next_node }
    return remove_node(node) if node_count != 1
  end

  def remove_node(given_node)
    final_node = given_node.next_node
    family_name = final_node.surname
    given_node.next_node = nil
    puts "The #{family_name} family has died of dysentery"
    final_node
  end

end
