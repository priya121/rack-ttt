require 'rack/test'
require 'controller'

describe Controller do


  before (:each) do 
    @controller = Controller.new
    MARKED_BOARD =  Board.new(["-", "-", "X",
                             "-", "O", "-",
                             "-", "O", "-"])
    EMPTY_BOARD = Board.new(["-", "-", "-",
                             "-", "-", "-",
                             "-", "-", "-"])
  end

  it 'marks a position on an empty board' do
    game = controller.create_game(EMPTY_BOARD)
    controller.make_move(game, 1)
    expect(game.board.mark_at(0)).to eq "X"
  end

  it 'marks a position on an already marked board' do
    game = controller.create_game(MARKED_BOARD)
    controller.make_move(game, 1)
    controller.make_move(game, 2)
    expect(game.board.mark_at(0)).to eq "O"
    expect(game.board.mark_at(1)).to eq "X"
  end

  it 'does not mark a taken position' do
    game = controller.create_game(MARKED_BOARD)
    controller.make_move(game, 3)
    expect(game.board.mark_at(2)).to eq "X"
  end

  it 'creates a new game with a given board and player move' do
    expect(controller.create_game(EMPTY_BOARD)).to be_a_kind_of(Game)
  end

  it 'creates a game state given a board and a player move' do
    expect(controller.create_game(MARKED_BOARD).board.mark_at(2)).to eq "X"
  end

  private

  attr_reader :controller

end
