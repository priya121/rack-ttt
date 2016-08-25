require 'request_handler'
require 'rack'

describe RequestHandler do 

  it "initially returns an empty board" do
    env = {}
    handler = RequestHandler.new(env)
    expect(handler.board).to eq "---------"
  end

  it "returns a marked position on the board" do
    env = {"board" => "-------X-"}
    handler = RequestHandler.new(env)
    expect(handler.board).to eq "-------X-"
  end

  it "returns player move" do
    env = {"player_move" => "8"}
    handler = RequestHandler.new(env)
    expect(handler.player_move).to eq 8
  end
end

