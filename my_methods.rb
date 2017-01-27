module Enumerable
    def my_each
        i=0
        while i < self.size
            yield(self[i])
            i += 1
        end
        self
    end
    
    def my_each_with_index
      i = 0
      while i < self.size
        yield(self[i], i)
        i += 1
      end
    self
    end
   def my_select
       return self unless block_given?
       select = []
       self.my_each {|x| select << x if yield(x)}
   select
   end
    
   def my_all?
      
      self.my_each {|x|  return false unless yield(x)}
      true
    end
    
    def my_any?
        self.my_each {|x| return true if yield(x)}
        false
    end
    
    def my_none?
        self.my_each {|x| return false if yield(x)}
        true
    end
    
    def my_count
        array = []
        self.my_each {|x| array << x if yield(x)}
        array.length
    end
    
    def my_map
        new_array = []
        self.my_each {|x| new_array << yield(x) }
        new_array
    end
    
    def my_inject(acc=nil)
        arr = acc.nil? ? self[1...size] : self
        acc ||= self[0]
        arr.my_each { |x,i| acc = yield(acc,x) }
        acc
    end
    
    def multiply_els
        self.my_inject { |x,y| x*y }
    
    end
    
end

    


#[10,14,18,7,20].my_all?{|x| x > 5}
#[10,14,18,7,20].my_each{|x| puts x}
puts [10,14,18,7,20].my_inject{|x, n| x + n}