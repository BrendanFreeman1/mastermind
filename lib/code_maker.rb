# frozen_string_literal: true

require_relative 'game_rules'

# <summery> The code maker game type <summery>
class CodeMaker
  def self.start
    GameRules.display_instructions_codemaker

    puts "\nPress ENTER to start"
    gets
    system 'clear'

    game_loop
  end

  def self.game_loop; end
end
