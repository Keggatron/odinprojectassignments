class LinkedList
  attr_reader :head

  def initialize (value = nil)
    @head = Node.new(value)
  end

  def append(value)
    node = @head
    node = node.next_node until node.next_node.nil?
    node.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    node = @head
    size = 1
    until node.next_node.nil?
      node = node.next_node
      size += 1
    end
    size
  end

  def tail
    node = @head
    node = node.next_node until node.next_node.nil?
    node
  end

  def at(index)
    node = @head
    index.times { node = node.next_node }
    node
  end

  def pop
    node = @head
    prev = nil
    until node.next_node.nil?
      prev = node
      node = node.next_node
    end
    prev.next_node = nil
  end

  def contains?(value)
    return true if @head.value == value
    node = @head
    until node.next_node.nil?
      node = node.next_node
      return true if node.value == value
    end
    false
  end

  def find(data)
    node = @head
    index = 0
    until node.next_node.nil? || node.value == data
      node = node.next_node
      index += 1
    end
    node.value == data ? index : -1
  end

  def to_s
    node = @head
    str = "( #{node} ) -> "
    until node.next_node.nil?
      str += "( #{node.next_node} ) -> "
      node = node.next_node
    end
    str += 'nil'
    str
  end

  def insert_at(index, value)
    node = @head
    prev = nil
    index.times do
      prev = node
      node = node.next_node
    end
    prev.next_node = Node.new(value, node)
  end

  def remove_at(index)
    node = @head
    prev = nil
    index.times do
      prev = node
      node = node.next_node
    end
    prev.next_node = node.next_node
  end

  class Node
    def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
    end
    attr_accessor :value
    attr_accessor :next_node

    def to_s
      @value
    end
  end
end

list = LinkedList.new('10')
list.append('12')
list.append('14')
list.append('45')

list.append('25')
puts list.head
list.pop
puts list.tail
=begin
list.append('melanie')
puts list
list.prepend('eleanor')
puts list
puts "list contains #{list.size} elements"
puts "the first element is #{list.head}"
puts "the last element is #{list.tail}"
puts "the element at index 2 is #{list.at(2)}"
puts 'pop!'
list.pop
puts list
puts "list contains 'chris' : #{list.contains? 'chris'}"
puts "list contains 'jofnir' : #{list.contains? 'jofnir'}"
list.append('carlyle')
list.append('beverly')
list.append('ruby')
puts list
puts "'beverly' is at index #{list.find 'beverly'}"
puts "'eleanor' is at index #{list.find 'eleanor'}"
puts "'ruby' is at index #{list.find 'ruby'}"
puts "inserting 'grover' at index 2"
list.insert_at 2, 'grover'
puts list
puts "removing at index 4"
list.remove_at 4
puts list
=end