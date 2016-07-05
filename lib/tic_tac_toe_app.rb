require 'rack'
require 'request_handler'

class TicTacToeApp
  def rack_up
    Rack::Builder.new do |env|
      map "/" do
        run (Proc.new do |env|
          [200, {}, [""]]
        end)
      end

      map "/play" do
        run (Proc.new do |env|
        marked_board = RequestHandler.new(Rack::Request.new(env)).index
        board = marked_board.cells.join
          [200, {}, [board]]
        end)
      end

    end.to_app
  end
end
