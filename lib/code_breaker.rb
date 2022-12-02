require_relative 'main'
require_relative 'game'
require_relative 'guess'
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

    until guesses >= 12
      puts "\nYou have #{12 - guesses} guesses left"
      guess = Guess.new
      guess = guess.player_guess

      game_end_win if win?(guess)

      puts test_guess(guess)

      guesses += 1
    end

    game_end_loose
  end

  def self.test_guess(guess)
    code = @code.dup
    responce = "\n"

    # Add a ✔ for each correct number in the correct position
    guess.each_char.with_index do |guess_char, i|
      @code.each_char.with_index do |code_char, j|
        if i == j && guess_char == code_char
          responce << '✔'
          guess[i] = '0'
          code[j] = '0'
        end
      end
    end

    # Remove duplicates in guess
    array = guess.split('') - ['0']
    guess = array.uniq.join('')

    # Add a 0 for each correct number in the incorrect positon
    guess.each_char do |char|
      count = code.count(char)
      count.times do
        responce << '■'
      end
    end
    puts "\n✔ - Correct number and position, ■ - correct number incorrect position"
    responce
  end

  def self.generate_code
    code = ''

    4.times do |_i|
      code += rand(1..6).to_s
    end

    code
  end

  def self.win?(guess)
    return true if guess == @code

    false
  end

  def self.game_end_win
    puts "\nYou deciphered the code!"
    puts '!!!!You Win!!!!'
    Main.repeat_game
  end

  def self.game_end_loose
    puts "\nYou didn't work out the code"
    Main.repeat_game
  end
end
