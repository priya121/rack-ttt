require 'rack/test'
require 'tic_tac_toe_app'

describe TicTacToeApp do
  include Rack::Test::Methods
  let (:application) {described_class.new}

  def app
    application.rack_up
  end

  context '/' do
    it 'returns OK' do
      get '/' do
        expect(last_response).to be_ok
      end
    end

    it 'takes an index and marks board' do
      get '/play', {"index" => 0} do
        expect(last_response.body).to eq "X--------" 
      end
    end
  end
end
