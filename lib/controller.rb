require 'web_human_player'
require 'core/ttt/board'
require 'core/ttt/game'

class Controller

  def create_game(board)
    player_x = WebHumanPlayer.new("X")
    player_o = WebHumanPlayer.new("O")
    Game.new(board, player_x, player_o)
  end

  def make_move(game, index)
    if move_provided(index)
      game.next_player.next_move = index - 1
      game.mark_board
    else
      game.board
    end
  end

  private

  def move_provided(index)
    index != 0
  end

end
