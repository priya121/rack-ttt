require 'rack'

class TicTacToeApp
  def rack_up
    Rack::Builder.new do |env|
      run (Proc.new do |env|
        [200, {}, [""]]
      end)
    end.to_app
  end
end
