text = ''
line_count = 0

lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

puts "#{line_count} lines"

total_characters = text.length
puts "#{total_characters} characters"

total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"

word_count = text.split.length
puts "#{word_count} words"

sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"

puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count/sentence_count} words per sentence (average)"

stop_words = %w{the a by on for of are with just but and to the my I has some in}


words = text.scan(/\w+/)
key_words = words.select {|word| !stop_words.include?(word)}
key_percentage = ((key_words.length.to_f / words.length.to_f) * 100).to_i
#key_words.join(' ')

#puts((key_words.length.to_f / words.length.to_f) * 100.to_i)
puts "#{key_percentage}% of text are key words"

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select {|sentence| sentence =~ /is|are/}
puts "Summary: \n\n" + ideal_sentences.join(". ")

puts "-- End of analysis"