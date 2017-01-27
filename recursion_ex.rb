=begin
def sum_upto(n)
    return 1               if n == 1
    return sum_upto(n-1) + n
end


puts sum_upto 6 # => 
=end

=begin
def append(ary, n)
    return ary if n < 0
    ary << n 
    append(ary, n-1)
end

print append([], 2)
=end


def reverse_append(ary, n)
    return ary if n < 0
    reverse_append(ary, n-1)
    ary << n
    ary
end

print reverse_append([], 3)

=begin
def factorial(n)
  if n == 0
    1
  else
    n * factorial(n-1)
  end
end
print factorial(5)
=end


=begin
def bottles(n)
    return puts "No more bottles of beer on the wall" if n == 0
    puts "#{n} bottles of beer on the wall"
    bottles(n-1)
   
end

bottles(10)
=end

=begin
def fib(n)
  if n == 0
    0
  elsif n == 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

puts fib(3)
=end
=begin
roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def roman_num(n)
=end    