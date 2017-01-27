require 'yaml'

class HangMan
    def initialize
        @turn = 0
        @error = 0
        pick_word
        @game_board = Array.new((@word.length)).fill('_')
        game_play
    end
    
    
    def pick_word
        contents = []
        File.open("dictionary.txt", "r").each_line do |word|                            #Getting words from dictionary and iterating through
            if (word.length > 5) && (word.length < 12)                                  #selecting words between 5 and 12 letters long
                contents << word.chomp.downcase                                         #adding selected words to array
            end
        end
        @word = contents.shuffle.take(1)                                                       #choosing random word from selected dictionary word
        puts @word
        @word = @word.to_s.scan(/\w/)
        print @word
        print @word.length
    end

    def game_play
        print @game_board 
        name
        guess
        game_end
    end

    def name
        
        if @turn == 0 
            puts "\nIf you'd like to load an old game please type in \"load\" now. If not please enter your name:"
            @name = gets.chomp.capitalize
                if @name == "Load"
                    self.load('saves/save.yaml')
                end
            puts "\nHello #{@name}, welcome to Hangman where you have to guess a word letter by letter. If at any time you'd like to save your game type in \"save\" when prompted for a letter."
            @turn += 1
            
        end
    end

    def guess
        @match = 0
        puts "\n#{@name}, guess a letter that you think is part of the word, you have #{5 - @error} errors left."
        @guess = gets.chomp.downcase
            if @guess == "save"
                self.to_save
                puts "Game has been saved. Would you like to quit? (y/n)"
                @quit_response = gets.chomp
                    if @quit_response == "y"
                        quit
                    end
            end
        @word.each_with_index {|letter, index| 
            if @guess == letter
                @game_board[index] = @word[index]   #if letter guessed is a match, change game_board index to that.
                @match += 1
            end
            
        }
        if @match == 0
                @error += 1
        end
        
    end

    def board
        
        print @game_board
    end
    
    def game_end
        if @game_board == @word
            print @game_board
            puts "\nCongrats, you win!"
            
        elsif @error < 5
            game_play
        
        elsif 
            puts "Game over, you lose"
            
        end
    end
   
    def to_save
       Dir.mkdir("saves") unless Dir.exists?("saves")
       
       filename = "saves/save.yaml"
       File.open(filename, 'w') do |file|
            file.print YAML.dump ({
                :name => @name,
                :game_board => @game_board,
                :word => @word,
                :error => @error
            })
        end
    end    
    
    def load(string)
        @data = YAML.load File.open(string), headers: true, header_converters: :symbol
        @name = @data[:name]
        @game_board = @data[:game_board]
        @word = @data[:word]
        @error = @data[:error]
        board
        
    end
    
    def quit
        abort "Thanks for playing!"
    end
    
        
end

@game = HangMan.new

