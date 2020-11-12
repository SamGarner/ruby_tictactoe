# frozen_string_literal: false

# create Player class to allow turn input/space choice and to update/switch the
class Player
  attr_reader :active_player # don't need accessor, just reader...

  def initialize
    @active_player = %w[X O].sample
    puts "\nTime for Tic Tac Toe !"
    puts "#{@active_player}'s will go first..."
  end

  def switch_active_player
    @active_player = @active_player == 'X' ? 'O' : 'X'
  end
end
