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
      expect do 
        board.check_for_win()
      end.to output("\n#{board.board_hash[:A1]}'s win !!\n").to_stdout#_from_any_process
      # expect(board.check_for_win).to output("\nX's win !!").to_stdout
      # expect(board.check_for_win).to eq("\nX's win !!")
    end
  end
end
