# <summery>Represents a player for the game<summery>
# <param name="name">Identifier for this class instance<param>
class Player
  attr_reader :name

  def initialise(name)
    @name = name
  end
end