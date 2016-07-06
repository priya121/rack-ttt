require 'web_human_player'

describe WebHumanPlayer do
  empty_three = ["-", "-", "-",
                 "-", "-", "-",
                 "-", "-", "-"]
  player = WebHumanPlayer.new("X")
  board = Board.new(empty_three)

  it 'has a mark' do
    expect(player.mark).to eq "X"
  end

  it 'has a move that can be set' do 
    player.next_move = 7
    expect(player.move(board)).to eq 7
  end
end

