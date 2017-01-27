def bubble_sort(array)

     
      while array.each_cons(2).any? {|a, b|  a > b}
       
                
           







array.each_with_index.map {|number, index|
  if array [index + 1].nil?
    number
    
    break
  elsif number > array[index + 1]
    array[index], array[index + 1] = array[index + 1], array[index]
    
  else 
    number
    
  end
  
}

end

p array
end

bubble_sort([6,4,12,2,7,8,9,3,1,0,9,8,7,6,5,4,3,2,1])



def bubble_sort_by(array1)
  while array1.each_cons(2).any? {|l, r| l.length > r.length}
    array1.each_with_index.map {|w, ix|
      if array1[ix + 1].nil?
        w
        break
      elsif w.length > array1[ix + 1].length
        array1[ix], array1[ix +1] = array1[ix+1], array1[ix]
      else
        w
      end
    }
  end
  p array1
end
bubble_sort_by(["hi","hello","hey","superduper", "masterful","fun", "so"])
  