class MasterMind
   def initialize
       @code = (1..8).to_a.shuffle.take(4)
       @board = Array.new(40).fill(".")
       @turn_count = 0
       @comp_matches = [] #computer guessed matches
       @comp_code = (1..8).to_a.shuffle.take(4)    #generating comp "guess": random computer guessed secret code
   end 
   
  def game_board
      puts  "#{@board[36]} | #{@board[37]} | #{@board[38]} | #{@board[39]}",
             "#{@board[32]} | #{@board[33]} | #{@board[34]} | #{@board[35]}",
             "#{@board[28]} | #{@board[29]} | #{@board[30]} | #{@board[31]}",
             "#{@board[24]} | #{@board[25]} | #{@board[26]} | #{@board[27]}",
             "#{@board[20]} | #{@board[21]} | #{@board[22]} | #{@board[23]}",
             "#{@board[16]} | #{@board[17]} | #{@board[18]} | #{@board[19]}",
             "#{@board[12]} | #{@board[13]} | #{@board[14]} | #{@board[15]}",
             "#{@board[8]} | #{@board[9]} | #{@board[10]} | #{@board[11]}",
             "#{@board[4]} | #{@board[5]} | #{@board[6]} | #{@board[7]}",
             "#{@board[0]} | #{@board[1]} | #{@board[2]} | #{@board[3]}"
 
  end
  
  def name
      while @turn_count < 1
        puts "What is your name?" 
        @name = gets.chomp.capitalize
        @turn_count += 1
        print @code
      end
      
  end
  
  def choice
      while @turn_count < 2
      puts "Do you want to GUESS the secret code or CREATE the secret code?"
      @choice = gets.chomp.downcase
        if @choice == "guess"
          @guess == true
          puts "OK here we go!"
          @turn_count += 1
          elsif @choice == "create"
          @guess == false
          puts "OK enter the secret code:"
          @code = gets.chomp
          @code = @code.split('').map(&:to_i)
          @turn_count += 1
        end
      end
  end
  
          
  def game_play 
      puts game_board
      name
      choice
      if self.game_over == false
        if @choice == "create"
            print @comp_code
            computer_guess
            board_fill
            puts game_board
            @turn_count += 1
        elsif @choice == "guess"
            print "#{@name}, "
            pcode
            board_fill
            @turn_count += 1
            code_match
        end
            
        
        game_play
      end
      
  end
 
  def pcode
    puts "Enter the code "
    @mind_code = gets.chomp   
    if @mind_code.length > 4 then
        puts "Your code is too long, please enter only 4 numbers:"
        pcode
        elsif @mind_code.length < 4 then
        puts "Your code is too short, please enter 4 numbers:"
        pcode 
    end    
    @mind_code = @mind_code.to_s.split('').map(&:to_i)
    
  end
        
  
  def code_match
      matches = [] #finding exact matches
    @mind_code.each_with_index {|x, n| 
        if @code[n] == @mind_code[n]
            matches.push(x)
            
        end
    }
    @intersection = @mind_code & @code #taking the matching numbers from the guessed array and the code array
    #puts @intersection
    if @intersection.empty?
        puts "You have no matches"
    else 
        puts "You have #{@intersection.length - matches.length} matching numbers that are in the wrong place!"
        puts"You have #{matches.length} exact matches"
    end
  end
  
  def game_over
      
    if (@mind_code) || (@comp_code) == @code
        puts "Congratulations you win!"
        true
        
    elsif @turn_count > 11
          puts "You were unable to guess the correct code in time. Sorry you lose!"
         true
    else
        false
      
    end
  end
  
  def board_fill #Filling the board as the player or computer guesses
      if @turn_count == 2
          @board[0..3] = (@guess)? (@mind_code[0..3]) : (@comp_code[0..3])
      else
          @board[(0 + (@turn_count - 2) *4)..(3  + (@turn_count - 1) *4)] = (@guess)? (@mind_code[0..3]) : (@comp_code[0..3])
      end
  end
  
  def computer_guess
    @comp_matches = [9,9,9,9]                   #making the values equal nine because they aren't part of the guess range, so they should never be part of the computer code. It's how to keep all values different. More code that goes along with it later.
    @matched_array = (1..8).to_a                #this is to remove values already part of the computer's guessed code in order to make the guesses all different. 
    @comp_code.each_with_index {|x, n|          #iterating through comp guessed code to find exact matches. 
        if @code[n] == @comp_code[n]
            @comp_matches[n] = x                #exact matches are kept and moved into another array for evaluation.
            @matched_array.delete(x)            #matched numbers are deleted from a counter array, that keeps all numbers in the computer code unique.
        end
    }


    @comp_matches.each_with_index {|x, y|                               #iterating through our matched array. 
        if x == 9                                                           
            @comp_matches[y] = @matched_array.to_a.shuffle.take(1){     #if any equal nine, we replace them with a random number.
                redo if @comp_matches.include?(@comp_matches[y])        #if any of the random numbers equal the matches we already have in the matches, we take a new random number.
        }
        end
    }
    @comp_code = @comp_matches.flatten
 end
end



game = MasterMind.new
game.game_play

