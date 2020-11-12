# frozen_string_literal: false
require 'require_all'
require 'stringio'  # not sure if needed?
require_all 'lib/tictac/'
# require_relative './lib/tictac/'

# testing that players win when they should

describe Board do
  describe '#check_for_win' do
    it 'player wins when has full top row' do
      board = Board.new
      board.board_hash[:A1] = 'X'
      board.board_hash[:A2] = 'X'
      board.board_hash[:A3] = 'X'
      expect { board.check_for_win }.to output("\n#{board.board_hash[:A1]}'s win !!\n").to_stdout#_from_any_process
    end

    it 'player wins when has diagnoals' do
      board = Board.new
      board.board_hash[:C1] = 'X'
      board.board_hash[:B2] = 'X'
      board.board_hash[:A3] = 'X'
      expect { board.check_for_win }.to output("\n#{board.board_hash[:C1]}'s win !!\n").to_stdout
    end

    it 'player wins when has full third column' do
      board = Board.new
      board.board_hash[:C1] = 'O'
      board.board_hash[:C2] = 'O'
      board.board_hash[:C3] = 'O'
      expect { board.check_for_win }.to output("\n#{board.board_hash[:C1]}'s win !!\n").to_stdout
    end

    it 'game ends in draw when no remaining playable spaces' do
      board = Board.new
      board.board_hash[:A1] = 'X'
      board.board_hash[:A2] = 'X'
      board.board_hash[:A3] = 'O'
      board.board_hash[:B1] = 'O'
      board.board_hash[:B2] = 'O'
      board.board_hash[:B3] = 'X'
      board.board_hash[:C1] = 'X'
      board.board_hash[:C2] = 'O'
      board.board_hash[:C3] = 'O'
      expect { board.check_for_win }.to output("Game over - it's a draw !\n").to_stdout
    end
  end
end
