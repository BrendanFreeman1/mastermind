require_relative 'main'
require_relative 'game'
require_relative 'player_code'
require_relative 'guess'
require_relative 'game_rules'

# <summery> The code breaker game type <summery>
class CodeBreaker

  def self.start
    GameRules.display_instructions_codebreaker

    puts "\nPress ENTER to start"
    gets
    system 'clear'

    game_loop
  end

  def self.game_loop
    code = generate_code
    guesses = 0

    until guesses >= 12
      puts "\nYou have #{12 - guesses} guesses left"
      puts 'Enter your guess for this turn'
      puts "\nYour Guess"
      guess = PlayerCode.new.player_code

      player_win if win?(code, guess)

      puts "\n✔ - Correct number and position, ■ - correct number incorrect position"
      puts Guess.test_guess(code, guess)

      guesses += 1
    end

    player_lose(code)
  end

  def self.generate_code
    code = ''

    4.times do
      code += rand(1..6).to_s
    end

    code
  end

  def self.win?(code, guess)
    return true if guess == code

    false
  end

  def self.player_win
    puts "\nYou deciphered the code!"
    puts '!!!!You Win!!!!'
    Main.repeat_game
  end

  def self.player_lose
    puts "\nYou didn't work out the code"
    puts "The code was #{code}"
    Main.repeat_game
  end
end
