class RequestHandler

  def initialize(request)
    @request = request
  end

  def player_move
    @request["player_move"].to_i
  end

  def start_game_text
    @request["start_game_text"]
  end

  def reset_game
    @request["restart"]
  end

end
