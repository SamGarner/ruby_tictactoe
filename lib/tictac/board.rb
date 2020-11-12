# frozen_string_literal: false

# create board for start of game
class Board
  attr_reader :board_hash 
  # why does 'reader' work for this and accessor isn't needed when we're updating values?
  # is it because the @current_game Board that the hash is being updated in is being 
  # created within the Game class itself ?
  def initialize
    @board_hash = { A1: '-', A2: '-', A3: '-', B1: '-', B2: '-', B3: '-',
                    C1: '-', C2: '-', C3: '-' }
  end

  def display_board
    puts '   1   2   3 '
    puts "A: #{@board_hash[:A1]} | " + "#{@board_hash[:A2]} | " + @board_hash[:A3].to_s
    puts '   --+---+--'
    puts "B: #{@board_hash[:B1]} | " + "#{@board_hash[:B2]} | " + @board_hash[:B3].to_s
    puts '   --+---+--'
    puts "C: #{@board_hash[:C1]} | " + "#{@board_hash[:C2]} | " + @board_hash[:C3].to_s
  end

  def check_for_win
    if @board_hash[:A1] != '-' &&
       ([@board_hash[:A1], @board_hash[:A2], @board_hash[:A3]].uniq.length == 1 ||
       [@board_hash[:A1], @board_hash[:B1], @board_hash[:C1]].uniq.length == 1 ||
       [@board_hash[:A1], @board_hash[:B2], @board_hash[:C3]].uniq.length == 1)
      puts "\n#{@board_hash[:A1]}'s win !!"
    elsif @board_hash[:B2] != '-' &&
          ([@board_hash[:B2], @board_hash[:A2], @board_hash[:C2]].uniq.length == 1 ||
          [@board_hash[:B2], @board_hash[:A3], @board_hash[:C1]].uniq.length == 1 ||
          [@board_hash[:B2], @board_hash[:B1], @board_hash[:B3]].uniq.length == 1)
      puts "\n#{@board_hash[:B2]}'s win !!"
    elsif @board_hash[:C3] != '-' &&
          ([@board_hash[:C3], @board_hash[:A3], @board_hash[:B3]].uniq.length == 1 ||
          [@board_hash[:C3], @board_hash[:C1], @board_hash[:C2]].uniq.length == 1)
      puts "\n#{@board_hash[:C3]}'s win !!"
    elsif !@board_hash.value?('-')
      puts "Game over - it's a draw !"
    else 1
    end
  end
end
