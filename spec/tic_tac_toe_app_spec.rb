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
  end
end
