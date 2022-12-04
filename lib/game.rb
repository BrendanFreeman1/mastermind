# frozen_string_literal: true

require_relative 'code_breaker'
require_relative 'code_maker'

# <summery> The mastermind game intro <summery>
class Game
  def self.start_game
    case choose_game_type
    when 'CodeMaker'
      CodeMaker.start
    when 'CodeBreaker'
      CodeBreaker.start
    end
  end

  def self.choose_game_type
    correct_answer = false
    intro_text

    until correct_answer
      answer = gets.strip.downcase

      case answer
      when 'm'
        choice = 'CodeMaker'
        correct_answer = true
      when 'b'
        choice = 'CodeBreaker'
        correct_answer = true
      else
        puts 'That is an incorrect response, try again'
      end
    end

    choice
  end

  def self.intro_text
    system 'clear'
    puts 'Mastermind is a game where one player tries to break the others code'
    puts 'Do you want to create the code and have the computer try to break it?'
    puts 'Or do you want to try to break a computer generated code?'
    puts "\nEnter 'M' to be the code Maker"
    puts "Enter 'B' to be the code Breaker"
  end
end
