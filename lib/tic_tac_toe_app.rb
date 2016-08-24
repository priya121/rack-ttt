require 'rack'
require 'controller'
require 'display'
require 'request_handler'

class TicTacToeApp

  def initialize
    @controller = Controller.new
  end

  def rack_up
    controller = @controller

    Rack::Builder.new do |env|

      map "/start" do
        run (Proc.new do |env|
          request = RequestHandler.new(Rack::Request.new(env))
          show = Display.new.home_page
          if request.start == "start"
            ['302', { 'Content-Type' => 'text/html', 'Location' => "/play" }, []]
          else 
            show = Display.new.home_page
            [200, {}, [show]]
          end
        end)
      end

      map "/play" do
        run (Proc.new do |env|
          request = RequestHandler.new(Rack::Request.new(env))
          player_move = request.player_move
          if player_move != 0
            display_board = controller.mark_board(request.board, player_move)
            show = Display.new.generate_display(display_board)
            [200, {}, [show]]
          else
            show = Display.new.generate_display(request.board)
            [200, {}, [show]]
          end
        end)
      end

    end.to_app
  end
end

