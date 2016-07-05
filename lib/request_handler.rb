require 'core/ttt/board'
require 'core/ttt/game'
require 'web_human_player'

class RequestHandler
  def initialize(request)
    @request = request
    empty_three = ["-", "-", "-",
                   "-", "-", "-",
                   "-", "-", "-"]
    @board = Board.new(empty_three)
    @player_x = WebHumanPlayer.new("X")
    @player_o = WebHumanPlayer.new("O")
  end

  def game
    @game = Game.new(@board, @player_x, @player_o)
    index = @request["player_move"]
    @game.next_player.next_move = index.to_i
    @game.mark_board
  end
end
