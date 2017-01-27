class Board
    def initialize
        @top = [1,2,3]
        @mid = [4,5,6]
        @bot = [7,8,9]
    end
    
    def game_board
        puts "#{@top[0]} | #{@top[1]} | #{@top[2]}",
        "---------",
        "#{@mid[0]} | #{@mid[1]} | #{@mid[2]}",
        "---------",
        "#{@bot[0]} | #{@bot[1]} | #{@bot[2]}"
    end
    def game_play
        while @game_over != true
            player_x
            puts self.game_board
            self.game_over
            if @game_over == true
                break
            end
            player_o
            self.game_over
            puts self.game_board
            if @game_over == true
                break
            end
            
        end
    end    
    
    def game_over
        
        if  @@used_numbers.uniq.length == 9
            @game_over = true
            puts "The game ends in a tie!!"
        elsif @top == ["X", "X", "X"] 
            @game_over = true
            puts "Player X wins!"
        elsif @mid == ["X", "X", "X"] 
            @game_over = true
            puts "Player X wins!"
        elsif @bot == ["X", "X", "X"] 
            @game_over = true
            puts "Player X wins!"
        elsif @top[0] == "X" && @mid[1] == "X" && @bot[2] == "X"
            @game_over = true
            puts "Player X wins!"
        elsif @top[2] == "X" && @mid[1] == "X" && @bot[0] == "X"
            @game_over = true
            puts "Player X wins!"
        elsif @top[0] == "X" && @mid[0] == "X" && @bot[0] == "X"
            @game_over = true
            puts "Player X wins!"
        elsif @top[1] == "X" && @mid[1] == "X" && @bot[1] == "X"
            @game_over = true
            puts "Player X wins!"
        elsif @top[2] == "X" && @mid[2] == "X" && @bot[2] == "X"
            @game_over = true
            puts "Player X wins!"
        elsif @top == ["O", "O", "O"] 
            @game_over = true
            puts "Player O wins!"
        elsif @mid == ["O", "O", "O"] 
            @game_over = true
            puts "Player O wins!"
        elsif @bot == ["O", "O", "O"] 
            @game_over = true
            puts "Player O wins!"
        elsif @top[0] == "O" && @mid[1] == "O" && @bot[2] == "O"
            @game_over = true
            puts "Player O wins!"
        elsif @top[2] == "O" && @mid[1] == "O" && @bot[0] == "O"
            @game_over = true
            puts "Player O wins!"
        elsif @top[0] == "O" && @mid[0] == "O" && @bot[0] == "O"
            @game_over = true
            puts "Player O wins!"
        elsif @top[1] == "O" && @mid[1] == "O" && @bot[1] == "O"
            @game_over = true
            puts "Player O wins!"
        elsif @top[2] == "O" && @mid[2] == "O" && @bot[2] == "O"
            @game_over = true
            puts "Player O wins!"  
        else
            @game_over = false
        end
    end
        
        
    @@used_numbers = []       
   
    
    
        def player_x 
            puts "Player X which space would you like to play?"
            @@place = gets.chomp.to_i
            if @@used_numbers.include?(@@place)
                
                puts "#{@@place} has already been selected. Please make another selection."
                player_x
            end
            if @@place > 9 
                puts "Please select a number from 1 to 9"
                player_x
            end
            if @@place <= 3
                @top[@@place-1] = "X"
                
            elsif (4..6).include?(@@place) 
                @mid[@@place-4] = "X"
               
            else 
                @bot[@@place-7] = "X"
                
            
            end
            
            @@used_numbers << @@place
            
        end
        def player_o
            puts "Player O which space would you like to play?"
            @@place = gets.chomp.to_i
            if @@used_numbers.include?(@@place)
                
                puts "#{@@place} has already been selected. Please make another selection."
                player_o
            end
            if @@place > 9 
                puts "Please select a number from 1 to 9"
                player_o
            end
            if @@place <= 3 
                @top[@@place-1] = "O"
                
            elsif (4..6).include?(@@place)
                @mid[@@place-4] = "O"
                
            else 
                @bot[@@place-7] = "O"
                
            end
            
            @@used_numbers << @@place
            
        end
    
end

a = Board.new
a.game_play

