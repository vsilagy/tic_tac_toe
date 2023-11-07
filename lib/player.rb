class Player
  # Use attr_reader to create getter methods for name and symbol.
  attr_reader :name, :symbol
  # Initialize the player with a name and a symbol ('X' or 'O').
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end 
end