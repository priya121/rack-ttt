require 'request_handler'
require 'rack'

describe RequestHandler do 
  env = {"board" => "X--------"}
  handler = RequestHandler.new(env)

  it "returns a marked board" do
    expect(handler.board).to eq "X--------"
  end
end

