require 'rack/test'
require 'tic_tac_toe_app'

describe TicTacToeApp do
  include Rack::Test::Methods
  let (:application) {described_class.new}


  def app
    application.rack_up
  end

  context 'home page' do
    it 'returns OK' do
      get '/start' do
        expect(last_response).to be_ok
      end
    end

    it 'starts with a home page' do
      get '/start' do
        expect(last_response.body).to include "Type start to begin a simple TTT game..." 
      end
    end

    it 'redirects from the start page when user submits start' do
      post '/start', 'start_game_text' => 'start'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to eq "http://example.org/play"
    end

    it 'does not redirect from the start page when user submits other input' do
      post '/start', 'start' => 'hi'
      expect(last_response.body).to include "Type start to begin a simple TTT game..." 
    end
  end

  context '/play' do
    it 'starts with an empty board' do
      get '/play' do
        expect(last_response.body).to_not include "X" 
      end
    end

    it 'takes an index and marks board' do
      get '/play', {"player_move" => 1} do
        expect(last_response.body).to include "X" 
      end
    end

    it 'takes an index and marks a board at a different position' do
      get '/play', {"player_move" => 7} do
        expect(last_response.body).to include "X" 
      end
    end

    it 'takes an index and marks a board at a different position' do
      get '/play', {"player_move" => 3} do
        expect(last_response.body).to include "X" 
      end
    end

    it 'makes a move on a stored board' do 
      marked_board = Board.new(["-", "X", "-",
                                "O", "O", "-",
                                "-", "X", "-"])
      get '/play', {"player_move" => 3}, {'rack.session' => {"board" => marked_board}} do
        expect(last_request.env['rack.session'][:board].cells).to eq ["-", "X", "X",
                                                                      "O", "O", "-",
                                                                      "-", "X", "-"]
      end
    end

    it 'resets a game when restart clicked' do 
      get '/play', {"restart" => "restart"} do
        expect(last_response.body).not_to include "X" 
        expect(last_response.body).not_to include "O" 
      end
    end
  end
end
