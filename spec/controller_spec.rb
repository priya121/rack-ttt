require 'rack/test'
require 'controller'

describe Controller do
    controller = Controller.new

  it 'marks a position on an empty board' do
    controller = Controller.new
    expect(controller.mark_board("---------", 6)).to eq "-----X---" 
  end

  it 'marks multiple positions on board' do
    controller = Controller.new
    mark_board_positions(controller, "---------", [1, 2, 3, 4])
    expect(controller.game.board.cells.join).to eq "XOXO-----" 
  end

  it 'does not mark a taken position' do
    controller = Controller.new
    expect(controller.mark_board("X----O---", 6)).to eq "X----O---" 
    expect(controller.mark_board("---OXX---", 6)).to eq "---OXX---" 
  end

  def mark_board_positions(controller, board, positions)
    positions.each do |position|
      controller.mark_board(board, position)
    end
    board
  end
end
