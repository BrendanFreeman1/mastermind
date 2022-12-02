# frozen_string_literal: true

# <summery> Functions for getting and checking the players guess <summery>
class Guess
  def player_guess
    puts "Enter your guess for this turn"
    puts "\nYour Guess"
    correct_input = false

    until correct_input
      guess = gets.strip 

      correct_input = check_guess_range(guess)

      check_guess_chars(guess)
    end

    guess
  end

  def check_guess_range(guess)
    return true if guess.to_i >= 1111 && guess.to_i <= 6666

    puts 'Incorrect input, enter four of the following digits: 1, 2, 3, 4, 5, 6'
    false
  end

  def check_guess_chars(guess)
    guess.each_char do |char|
      if char.to_i.zero?
        puts 'Input must be digits only'
        break
      end
    end
  end
end
