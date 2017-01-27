

class LinkedList
    
    attr_accessor :head, :tail, :size
    
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end
    
    def append(data)
        node = Node.new(data)
        @size += 1
        if @head.nil?
            @head = node
            @tail = @head
        else 
            @tail.next_node = node
            @tail = @tail.next_node
        end
    end
    
    def prepend(data)
        node = Node.new(data)
        @size += 1
        if @head.nil?
            @head = node
            @tail = head
        else
            @head.next_node = @head
            @head = node
        end
    end
    
    def size 
        @size
    end
    
    def head
        @head
    end
    
    def tail
        @tail
    end
    
    def at(index)
        return nil if index > @size || index < 0
        place = @head
        index.times {place = place.next_node}
        place
    end
    
    def pop
        place = @head
        
        until place.next_node == @tail 
            place = place.next_node
            puts place
        end
        place.next_node = nil
        @tail = place
        @size -= 1
    end
    
    def contains?(data)
        place = @head
        until place.next_node == nil
            if place == data
                true
            else
                place.next_node
            end
        end
        if place != data
            false
        end
    end
    
    def find(data)
        place = @head
        index = 0
        puts place
        puts data
        #until index == @size - 1
            
            if place == data
                puts index
            else
                place.next_node.nil?
                nil
            end
        #end
    end    
    def to_s
        place = @head
        until place.next_node.nil?
            print "( #{place} ) -> "
            place = place.next_node
        end
        print "( #{place} ) -> "
        print "nil"
    end
   




    class Node
            attr_accessor :value, :next_node
        def initialize(value = nil, next_node = nil)
            @value = value
            @next_node = next_node
        end
        def to_s
            @value
        end
    end
end


a = LinkedList.new


a.append('11')
a.append('15')
a.append('28')
a.append('13')

#a.prepend('20')
puts a.find('11')
puts a.size
#puts a.at(1)
puts a.head
puts a.tail
puts a.to_s
#puts a.find('11')
#puts a.at(3)
#puts a.head
#puts a.tail
#puts a.at(2)