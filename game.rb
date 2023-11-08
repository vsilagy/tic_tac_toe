require_relative 'lib/board.rb'
require_relative 'lib/player.rb'


# Define the Game class.
class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @current_player = @player1
  end

  # Define a method to switch the current player after a turn.
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # Define a method to check if the current player has won the game
  def check_win
    if @board.winning_combination?(@current_player.symbol)
      @running = false
      puts "#{@current_player.name} wins!"
      return true
    end
    false
  end

  # Define a method to check if the board is full
  def check_draw
    if @board.full?
      @running = false
      puts "It's a draw!"
      return true
    end
    false
  end

  def play_turn
    @board.render
    move = @current_player.get_move(@board)
    @board.place_symbol(@current_player.symbol, move)
    check_win || check_draw
    switch_player unless @running
  end


  def start
    @running = true
    puts "Welcome to Tic-Tac-Toe!"
    while @running
      play_turn
    end
    @board.render
    puts "Game over!"
  end
end

game = Game.new
game.start 