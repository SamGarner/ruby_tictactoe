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
       puts "#{@board_hash[:A1]}'s win !!"
    elsif @board_hash[:B2] != '-' &&
          [@board_hash[:B2], @board_hash[:A2], @board_hash[:C2]].uniq.length == 1 ||
       [@board_hash[:B2], @board_hash[:A3], @board_hash[:C1]].uniq.length == 1 ||
       [@board_hash[:B2], @board_hash[:B1], @board_hash[:B3]].uniq.length == 1
       puts "#{@board_hash[:B2]}'s win !!"
    elsif @board_hash[:C3] != '-' &&
       [@board_hash[:C3], @board_hash[:A3], @board_hash[:B3]].uniq.length == 1 ||
       [@board_hash[:C3], @board_hash[:C1], @board_hash[:C2]].uniq.length == 1
       puts "#{@board_hash[:C3]}'s win !!"
    elsif !@board_hash.has_value?('-')
      puts "Game over - it's a draw !"
    else
      #display board, player choose, etc.
    end
  end

  def display_board
    puts '   1   2   3 '
    puts "A: #{@board_hash[:A1]} | " + "#{@board_hash[:A2]} | " + @board_hash[:A3].to_s
    puts '   --+---+--'
    puts "B: #{@board_hash[:B1]} | " + "#{@board_hash[:B2]} | " + @board_hash[:B3].to_s
    puts '   --+---+--'
    puts "C: #{@board_hash[:C1]} | " + "#{@board_hash[:C2]} | " + @board_hash[:C3].to_s
  end
end

# create Player class to allow turn input/space choice and to update/switch the
# active player
class Player
  def initialize
    @active_player = ['X','O'].sample
    puts "\nTime for Tic Tac Toe !"
    puts "#{@active_player}'s will go first..."
  end

  def choose_space
    puts 'Choose a space between A1 and C3 that has not been played yet:'
    @play = gets.chomp   
  end

  def switch_active_player
    case @active_player
    when 'X' then 'O'
    else 'X'
    end
  end
end

class Game
  def initialize
    @current_game = Board.new
    @current_game.display_board
    Player.new
  end

  def game_over?
    @board_hash.has_value?('-')? #[codefornextturn] : puts 'Game over - it's a draw!'
  end

  def play_again?
    puts "Type 'y' if you would like to play again and any other key to exit"
    @play_again = gets.chomp.downcase
    case @play_again
    when 'y'
      Game.new
    end
end

Game.new

# array.sample
# single quotes preferred if no interpolation
# .to_s preferred to interpolation if only getting the hash value