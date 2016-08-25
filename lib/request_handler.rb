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

  def start_game_text
    @request["start_game_text"]
  end
end
