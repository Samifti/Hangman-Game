class Hangman

  def initialize
    #This 
    @word = words.sample
    @lives = 7
    #T first in word teaser we are declaring it blank
    @word_teaser = ""
    # using do loop we are addin the dashes. 
    @word.first.size.times do @word_teaser += "_ "
    end
  end

  def words
    # These are the words that will be used in the game.
    # We are using first to access the array.
    # Size is a ruby operator that determines the characters length.

    [
      ["academy", "A place to gain education"],
      ["bedroom", "A place to sleep In"],
      ["nervous", "Another word for Anxiety"],
      ["vehicle", "A mode of Transport"],
      ["wedding", "A promise between 2 people"],
    ]
  end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
	#checks where the letter is placed and leaves the rest of the spaces blank.
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split #The word is split into an array
    #Split splits the string into seperate letters into an array

    new_teaser.each_with_index do |letter, index|
      # replace blank values with guessed letter if matches letter in word
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    #Live > 0 the if condition will keep on running until the lives are equal to 0
    if @lives > 0
    puts "Enter a letter (use lowercase)"
    guess = gets.chomp
    
    good_guess = @word.first.include? guess

    #We are calling another if condition    
          if guess == "exit"
          puts "Thank you for playing!"
          elsif guess.length > 1
          puts "Only guess 1 letter at a time please!"
          #Function repeated
          make_guess
          elsif good_guess
          puts "You are correct!"
          #We are sending the guess into print_teaser
          print_teaser guess
              if @word.first == @word_teaser.split.join
                puts "Congratulations... you have won this round!"
              else
              # Unless until the dashes are completed by using else we are calling the function.
              make_guess
              end
          else
          @lives -= 1
          puts "Sorry... you have #{ @lives } lives left. Try again!"
          make_guess
          end 
      else @lives == 0
      puts "Game over... better luck next time!"
    end
  end

  def main
    #This is the main function in which we are calling the other function
    puts "Welcome to the game \nYour word is #{ @word.first.size } characters long \nTo exit game at any point type 'exit'"
    puts "This is a case sensitive game hence every word given is in lower case"
    print_teaser
    puts "Clue: #{ @word.last }"
    make_guess
  end

end

game = Hangman.new
game.main
