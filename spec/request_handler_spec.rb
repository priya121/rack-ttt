require 'request_handler'
require 'rack'

describe RequestHandler do 

  it "initially returns an empty board" do
    env = {}
    handler = RequestHandler.new(env)
    expect(handler.create_board.cells).to eq ["-", "-", "-", 
                                                      "-", "-", "-",
                                                      "-", "-", "-"]
  end

  it "returns player move" do
    env = {"player_move" => "8"}
    handler = RequestHandler.new(env)
    expect(handler.player_move).to eq 8
  end

  it "returns a board with a marked position" do
    env = {"board" => "-------X-"}
    handler = RequestHandler.new(env)
    expect(handler.create_board.mark_at(7)).to eq "X"
  end

end

