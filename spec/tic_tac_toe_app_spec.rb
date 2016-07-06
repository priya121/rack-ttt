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
      get '/play', {"player_move" => 0} do
        expect(last_response.body).to include "X--------" 
      end
    end

    it 'takes an index and marks a board at a different position' do
      get '/play', {"player_move" => 7} do
        expect(last_response.body).to include "------X-" 
      end
    end

    it 'marks player one and player two first moves on board' do
      get '/play', {"board" => "X------O-"} do
        expect(last_response.body).to include "X------O-" 
      end
    end
  end
end
