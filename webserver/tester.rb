def rock_judger(rocks)    
    #if rocks.length <= 2  # the base case
     # a = rocks[0]
      #b = rocks[-1]
    #else
      @a = rock_judger(rocks.slice!(0,rocks.length/2))
      print @a
  end
      
      
     # b = rock_judger(rocks)
     
      
    #end    
    
   # return a #> b ? a : b
#end


rocks = 30.times.map{rand(200) + 1}
=begin
puts rocks.join(', ')
puts "Heaviest rock is: #{rock_judger(rocks)}"

=end
=begin
140, 199, 155, 135, 105, 156, 105, 160, 54, 157, 62, 189, 102, 182, 106, 105, 122, 87, 152, 57, 51, 127, 10, 143, 98, 145, 161, 131, 113, 171
140 199 135 199 160 160 189 199 105 122 152 152 143 145 161 

Heaviest rock is: 199
=end

=begin

29, 102, 113, 60, 173, 99, 29, 1, 63, 131, 62, 120, 33, 192, 70, 71, 86, 116, 52, 196, 188, 175, 170, 97, 128, 56, 100, 6, 35, 121
29 29 60 29 111 20 29 71 71 52 71 170 170 100 

Heaviest rock is: 29

=end


rock_judger(rocks)