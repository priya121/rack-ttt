require 'rack/test'
require 'controller'

describe Controller do
    controller = Controller.new

  it "creates an new game" do
    expect(controller.game.board.cells.size).to eq 9
  end

  it 'marks a position on the board' do
    expect(controller.mark_board("---------", 6)).to eq "-----X---" 
  end
end
