require 'rack'
require 'display'
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
          request = RequestHandler.new(Rack::Request.new(env))
          current_board = request.board 
          display_board = request.mark_board(current_board)
          show = Display.new.generate_display(display_board)
          [200, {}, [show]]
        end)
      end

    end.to_app
  end
end
