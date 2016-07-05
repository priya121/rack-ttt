$LOAD_PATH.unshift File.join(File.dirname(__FILE__), 'lib')

require 'tic_tac_toe_app'

run TicTacToeApp.new.rack_up


