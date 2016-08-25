require 'web_human_player'
require 'core/ttt/board'
require 'core/ttt/game'

class Controller

  attr_reader :game

  def initialize
    @player_x = WebHumanPlayer.new("X")
    @player_o = WebHumanPlayer.new("O")
    @board = Board.new(Array.new(9,"-"))
    @game = Game.new(@board, @player_x, @player_o)
  end

  def mark_board(current_board, index)
    board = Board.new(current_board.split(""))
    set_player_move(index)
    if empty?(board.cells, @game.next_player.next_move) && move_not_made(index)
      @game.mark_board.cells.join("")
    else
      current_board
    end
  end

  private

  def empty?(board, index)
    board[index] == "-" 
  end

  def set_player_move(index)
    @game.next_player.next_move = index - 1
  end

  def move_not_made(index)
    index != 0
  end

end
