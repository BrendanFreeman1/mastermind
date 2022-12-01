# frozen_string_literal: true

require_relative 'game'

# <summery> The program starting point <summery>
class Main
  def self.create_new_game
    Game.start_game
  end

  def self.repeat_game
    puts "\nDo you want to play again? Y/N"

    answer = gets.strip.downcase
    %w[yes y].include?(answer) ? create_new_game : exit
  end
end

Main.create_new_game
