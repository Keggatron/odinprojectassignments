def merge_sort(ary)
    return ary if ary.length == 1
    half = ary.length / 2
    a = ary[0...half]
    b = ary[half...ary.length]
    a = merge_sort(a)
    b = merge_sort(b)
    
    merge(a,b)
    
end


def merge(a, b)
    merged = []
    until a.empty? || b.empty?
        if a.first < b.first
            merged << a.shift
        else
            merged << b.shift
        end
    end
    
    merged += a + b
    
end



print merge_sort([1,6,9,4,3,8])