# frozen_string_literal: true

require_relative 'game_rules'
require_relative 'player_code'
require_relative 'guess'

# <summery> The code maker game type <summery>
class CodeMaker

  def self.start
    GameRules.display_instructions_codemaker

    Guess.possible_combinations

    puts "\nPress ENTER to start"
    gets
    system 'clear'

    game_loop
  end

  def self.game_loop
    code = player_code
    guesses = 0

    until guesses >= 1
      guess = Guess.computer_guess(code)

      computer_win if win?(code, guess)

      guesses += 1
    end  
  
    computer_lose
  end

  def self.win?(code, guess)
    return true if guess == code

    false
  end

  def self.player_code
    puts "Please enter a code for the computer to try to guess"

    PlayerCode.new.player_code
  end

  def self.computer_win
    puts "The computer deciphered your code"
    Main.repeat_game
  end

  def self.computer_lose
    puts "The computer couldnt crack your code!!"
    Main.repeat_game
  end

end
