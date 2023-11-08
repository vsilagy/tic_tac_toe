class Board
  WINNING_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
  ].freeze

  def initialize
    @cells = Array.new(9, '')
  end

  def render
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def update_cell(position, symbol)
    @cells[position] = symbol if valid_move?(position)
  end

  def valid_move?(position)
    position.between?(0, 8) && @cells[position] == ' '
  end

  def full?
    !@cells.include?(' ')
  end

  def winning_combination?(symbol)
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? { |index| @cells[index] == symbol }
    end
  end

end