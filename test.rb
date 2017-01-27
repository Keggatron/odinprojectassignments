def initialize_board(n, val)
  Array.new(n) { Array.new(n) { val } }
end

arr = initialize_board(3, nil)
print arr