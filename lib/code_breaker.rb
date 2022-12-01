# frozen_string_literal: true

require_relative 'main'
require_relative 'game'
require_relative 'game_rules'

# <summery> The code breaker game type <summery>
class CodeBreaker
  def initialise
    @code = 0
  end

  def self.start
    GameRules.display_instructions_codebreaker
    @code = generate_code

    puts "\nPress ENTER to start"
    gets
    system 'clear'

    game_loop
  end

  def self.game_loop
    guesses = 0

    until guesses > 12
      puts @code

      guess = player_guess

      game_end if win?(guess)

      check_guess(guess)

      guesses += 1
    end
  end

  def self.generate_code
    code = ''

    4.times do |_i|
      code += rand(1..6).to_s
    end

    code
  end

  def self.player_guess
    puts 'Enter your guess for this turn'
    gets.strip

    # check for correct input
  end

  def self.win?(guess)
    return true if guess == @code

    false
  end

  def self.check_guess; end

  def self.game_end
    puts "\nYou deciphered the code!"
    puts '!!!!You Win!!!!'
    Main.repeat_game
  end
end
