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
          env['rack.session'][:board] = request.create_board
          requested = Rack::Request.new(env)
          game = controller.create_game(requested.session[:board])
          display_board = controller.make_move(game, request.player_move)
          show = Display.new.generate_display(display_board)
          [200, {}, [show]]
        end)
      end

    end.to_app
  end
end

