# frozen_string_literal: false

# create board for start of game
class Board
  def initialize
    @board_hash = { A1: '-', A2: '-', A3: '-', B1: '-', B2: '-', B3: '-',
                    C1: '-', C2: '-', C3: '-' }
  end

  def check_for_win
    if @board_hash[:A1] != '-' &&
       [@board_hash[:A1], @board_hash[:A2], @board_hash[:A3]].uniq.length == 1 ||
       [@board_hash[:A1], @board_hash[:B1], @board_hash[:C1]].uniq.length == 1 ||
       [@board_hash[:A1], @board_hash[:B2], @board_hash[:C3]].uniq.length == 1
    elsif @board_hash[:B2] != '-' &&
          [@board_hash[:B2], @board_hash[:A2], @board_hash[:C2]].uniq.length == 1 ||
       [@board_hash[:B2], @board_hash[:A3], @board_hash[:C1]].uniq.length == 1 ||
       [@board_hash[:B2], @board_hash[:B1], @board_hash[:B3]].uniq.length == 1
    elsif @board_hash[:C3] != '-' &&
       [@board_hash[:C3], @board_hash[:A3], @board_hash[:B3]].uniq.length == 1 ||
       [@board_hash[:C3], @board_hash[:C1], @board_hash[:C2]].uniq.length == 1
    then @win = 1
    else @win = 0
    end
  end

  def display_board
    puts "#{@board_hash[:A1]} | " + "#{@board_hash[:A2]} | " + @board_hash[:A3].to_s
    puts '--+---+--'
    puts "#{@board_hash[:B1]} | " + "#{@board_hash[:B2]} | " + @board_hash[:B3].to_s
    puts '--+---+--'
    puts "#{@board_hash[:C1]} | " + "#{@board_hash[:C2]} | " + @board_hash[:C3].to_s
  end
end
