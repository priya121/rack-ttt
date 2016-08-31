require 'rack/test'
require 'controller'

describe Controller do

  it 'marks a position on an empty board' do
    controller = Controller.new
    board = Board.new(["-", "-", "-",
                       "-", "-", "-",
                       "-", "-", "-"])
    game = controller.create_game(board)
    controller.make_move(game, 1)
    expect(game.board.mark_at(0)).to eq "X"
  end

  it 'marks a position on an already marked board' do
    controller = Controller.new
    board = Board.new(["-", "-", "X",
                       "-", "O", "-",
                       "-", "O", "-"])
    game = controller.create_game(board)
    controller.make_move(game, 1)
    controller.make_move(game, 2)
    expect(game.board.mark_at(0)).to eq "O"
    expect(game.board.mark_at(1)).to eq "X"
  end

  it 'does not mark a taken position' do
    controller = Controller.new
    board = Board.new(["-", "-", "X",
                       "-", "O", "-",
                       "-", "O", "-"])
    game = controller.create_game(board)
    controller.make_move(game, 3)
    expect(game.board.mark_at(2)).to eq "X"
  end

  it 'creates a new game with a given board and player move' do
    controller = Controller.new
    board = Board.new(Array.new(9, "-"))
    expect(controller.create_game(board)).to be_a_kind_of(Game)
  end

  it 'creates a game state given a board and a player move' do
    controller = Controller.new
    board = Board.new(["-", "-", "X",
                       "-", "O", "-",
                       "-", "O", "-"])
    expect(controller.create_game(board).board.mark_at(2)).to eq "X"
  end
end
