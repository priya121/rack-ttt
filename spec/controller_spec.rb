require 'rack/test'
require 'controller'

describe Controller do
    controller = Controller.new

  it 'marks a position on an empty board' do
    controller = Controller.new
    expect(controller.mark_board("---------", 6)).to eq "-----X---" 
  end

  it 'marks a position on an already marked board' do
    controller = Controller.new
    controller.mark_board("---------", 1)
    controller.mark_board("X--------", 2)
    controller.mark_board("XO-------", 9)
    expect(controller.game.board.cells.join).to eq "XO------X" 
  end

  it 'does not mark a taken position' do
    controller = Controller.new
    expect(controller.mark_board("X----O---", 6)).to eq "X----O---" 
    expect(controller.mark_board("---OXX---", 6)).to eq "---OXX---" 
  end
end
