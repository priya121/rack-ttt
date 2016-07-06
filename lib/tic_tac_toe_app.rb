require 'rack'
require 'display'
require 'request_handler'

class TicTacToeApp
  empty_three = ["-", "-", "-",
                 "-", "-", "-",
                 "-", "-", "-"]
  $board = Board.new(empty_three)
  def rack_up
    Rack::Builder.new do |env|
      map "/" do
        run (Proc.new do |env|
          [200, {}, [""]]
        end)
      end

      map "/play" do
        run (Proc.new do |env|
          request = RequestHandler.new(Rack::Request.new(env), $board)
          display = Display.new
          marked_board = request.game
          $board = marked_board
          board = marked_board.cells.join
          show = display.generate_display(board)
          [200, {}, [show]]
        end)
      end

    end.to_app
  end
end
