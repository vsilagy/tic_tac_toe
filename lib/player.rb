class Player
  # Use attr_reader to create getter methods for name and symbol.
  attr_reader :name, :symbol
  # Initialize the player with a name and a symbol ('X' or 'O').
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end 

  # Define the get_move method that will ask the player for their move.
  def get_move(board)
    selected_position = nil
    until selected_position.is_a?(Integer) && board.valid_position?(selected_position)
      puts "#{@name}, enter the position (1-9) where you'd like to place your #{@symbol}:"
      input = gets.chomp
      selected_position = input.to_i if input.match?(/^\d+$/) # Convert to an integer if the input is a digit
      unless board.valid_position?(selected_position)
        puts "Invalid move. Please enter a number between 1 and 9 that is not already taken."
      end
    end
    selected_position
  end
end