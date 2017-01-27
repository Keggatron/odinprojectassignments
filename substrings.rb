def substrings(phrase, dictionary)
    hash = {}
    
    new_phrase = phrase.downcase
    
    dictionary.each do |word|
        hash[word] = new_phrase.scan(word).count if new_phrase.include?(word)
    end
    hash
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)    