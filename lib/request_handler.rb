class RequestHandler
  def initialize(request)
    @request = request
  end

  def player_move
    @request["player_move"].to_i
  end

  def create_board
    current_board = @request["board"]
    current_board.nil? ? Board.new(Array.new(9, "-")) : Board.new(current_board.split(""))
  end

  def start_game_text
    @request["start_game_text"]
  end
end
