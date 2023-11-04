require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @current_player = 'X'
  end

end

 