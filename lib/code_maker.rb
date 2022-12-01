# frozen_string_literal: true

require_relative 'game_rules'

# <summery> The code maker game type <summery>
class CodeMaker
  def self.start
    GameRules.display_instructions_codemaker
  end
end
