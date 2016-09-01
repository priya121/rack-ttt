require 'request_handler'
require 'rack'

describe RequestHandler do 

  it "returns player move" do
    env = {"player_move" => "8"}
    handler = RequestHandler.new(env)
    expect(handler.player_move).to eq 8
  end

end

