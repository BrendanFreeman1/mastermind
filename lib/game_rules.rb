# frozen_string_literal: true

# <summery> The rules for each game type <summery>
class GameRules
  def self.display_instructions_codebreaker
    system 'clear'
    puts 'The computer will generate a code for you to break'
    puts 'The code is a random sequence of four digits'
    puts "The digits can be either '1' '2' '3' '4' '5' or '6'"
    puts 'Multiples of the same digit can appear in the code'
    puts "You must select the correct sequence of numbers within twelve guesses\n\n"
    puts 'For each guess you will be given a responce indicating how close their guess was'
    puts "You will recieve a '✔' for each correct number in the correct position"
    puts "You will recieve a '■' for each correct number not in the correct position"
    puts "The response will never indicate which of the numbers are in the correct position\n"
    puts "If you guess the correct digits in the correct order, you win\n"
  end

  def self.display_instructions_codemaker
    system 'clear'
    puts 'You are to input a code for the computer to try to break'
    puts 'The code is a random sequence of four digits'
    puts "The digits can be either '1' '2' '3' '4' '5' or '6'"
    puts "Multiples of the same digit can appear in the code\n"
    puts 'The computer will try to break the code in twelve guesses'
    puts "If it is unable to, you win\n"
  end
end
