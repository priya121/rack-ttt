class WebHumanPlayer
  attr_accessor :next_move

  def initialize(symbol)
    @symbol = symbol
  end

  def mark
    @symbol
  end

  def move(board)
    next_move
  end
end
