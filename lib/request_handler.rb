require 'core/ttt/board'

class RequestHandler


  def initialize(request)
    @request = request
    @empty_three = ["-", "-", "-",
                    "-", "-", "-",
                    "-", "-", "-"]
  end

  def index
    board = Board.new(@empty_three)
    index = @request["index"]
    board.mark("X", index.to_i)
  end

end
