# frozen_string_literal: true

require_relative 'player'
require_relative 'game_rules'

class Game

  def initialise

    @player = Player.new('Player 1')
  end

  def start_game
    #prompt for game type

    GameRules.display_instructions_codebreaker



    #start breaker game
    #or
    #start maker game
  end

end

def start_new_game
  new_game = Mastermind.new
  new_game.start_game
end