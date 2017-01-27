def fibs(n)
    sequence = []
    n.times do |num|
        if num == 0
            sequence << 0 
        elsif 
            num == 1
            sequence << 1
        else
            sequence << (sequence[num - 1] + sequence[num-2])
        end
    end
    sequence
end


puts fibs(6)

def fibs_rec(ary = [0, 1], n)
    return ary[0] if n == 0
    return ary if n ==1 || ary.length > n
    fibs_rec((ary << (ary[-1] + ary[-2])), n)
end


print fibs_rec(3)
