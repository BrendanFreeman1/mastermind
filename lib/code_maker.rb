# frozen_string_literal: false

require_relative 'game_rules'
require_relative 'player_code'
require_relative 'guess'

# <summery> The code maker game type <summery>
class CodeMaker
  def self.start
    GameRules.display_instructions_codemaker

    puts "\nPress ENTER to start"
    gets
    system 'clear'

    game_loop
  end

  def self.game_loop
    combinations = Array.new(Guess.possible_combinations)
    code = player_code
    guesses = 1

    until guesses >= 13
      puts combinations.length
      # Assign computer guess
      guess = Guess.computer_guess(combinations, guesses)
      # Check if the guess was correct
      computer_win if win?(code, guess)
      # Work out what the next guess should be
      combinations = Guess.calculate_from_guess(combinations, code, guess)

      guesses += 1
    end

    computer_lose
  end

  def self.win?(code, guess)
    return true if guess == code

    false
  end

  def self.player_code
    puts 'Please enter a code for the computer to try to guess'

    PlayerCode.new.player_code
  end

  def self.computer_win
    puts 'The computer deciphered your code'
    Main.repeat_game
  end

  def self.computer_lose
    puts "The computer couldn't crack your code!!"
    Main.repeat_game
  end
end
