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

end
