def caesar_cipher(phrase, shift)

    phrase = phrase.split(//).map(&:ord).to_a
    shifted = []
    phrase.each do |n| 
        if n.between?(65, 90) || n.between?(97,122)
            shifted << (n + shift)
        else 
            shifted << (n)
        end
    
end   

shifted.each {|i|  print i.chr.inspect }


end


caesar_cipher("what a string", 5) 



