class RequestHandler
  def initialize(request)
    @request = request
  end

  def player_move
    @request["player_move"].to_i
  end

  def board
    current_board = @request["board"]
    current_board.nil? ? "---------" : current_board 
  end

  def start
    @request["start"]
  end
end
