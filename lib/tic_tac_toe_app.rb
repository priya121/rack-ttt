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
    board = @board

    Rack::Builder.new do |env|
      use Rack::Session::Cookie

      map "/start" do
        run (Proc.new do |env|
          request = RequestHandler.new(Rack::Request.new(env))
          show = Display.new.home_page
          if request.start_game_text == "start"
            res = Rack::Response.new
            res.redirect("/play")
            res.finish
          else 
            show = Display.new.home_page
            [200, {}, [show]]
          end
        end)
      end

      map "/play" do
        run (Proc.new do |env|
          request = RequestHandler.new(Rack::Request.new(env))
          current_board = env['rack.session'][:board]
          
          if current_board.nil? || request.reset_game == "restart"
            current_board = Board.new(Array.new(9, "-")) 
          end

          game = controller.create_game(current_board)
          display_board = controller.make_move(game, request.player_move)
          env['rack.session'][:board] = display_board
          show = Display.new.generate_display(display_board)
          [200, {}, [show]]
        end)
      end

    end.to_app
  end
end

