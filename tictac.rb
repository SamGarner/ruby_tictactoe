# frozen_string_literal: false

# create board for start of game
class Board
  attr_accessor :board_hash
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

  def play_again?
    puts "Type 'y' if you would like to play again and any other key to exit :"
    @play_again = gets.chomp.downcase
    case @play_again
    when 'y'
      Game.new
    end
  end

  def check_for_win
    if @board_hash[:A1] != '-' &&
       ([@board_hash[:A1], @board_hash[:A2], @board_hash[:A3]].uniq.length == 1 ||
       [@board_hash[:A1], @board_hash[:B1], @board_hash[:C1]].uniq.length == 1 ||
       [@board_hash[:A1], @board_hash[:B2], @board_hash[:C3]].uniq.length == 1)
       puts "board_hash[:A1] != '-'"
       puts "\n#{@board_hash[:A1]}'s win !!"
       play_again?
    elsif @board_hash[:B2] != '-' &&
       ([@board_hash[:B2], @board_hash[:A2], @board_hash[:C2]].uniq.length == 1 ||
       [@board_hash[:B2], @board_hash[:A3], @board_hash[:C1]].uniq.length == 1 ||
       [@board_hash[:B2], @board_hash[:B1], @board_hash[:B3]].uniq.length == 1)
       puts "board_hash[:B1] != '-'"
       puts "#{@board_hash[:B2].inspect}"
       puts "\n#{@board_hash[:B2]}'s win !!"
       play_again?
    elsif @board_hash[:C3] != '-' &&
       ([@board_hash[:C3], @board_hash[:A3], @board_hash[:B3]].uniq.length == 1 ||
       [@board_hash[:C3], @board_hash[:C1], @board_hash[:C2]].uniq.length == 1)
       puts "board_hash[:C3] != '-'"
       puts "\n#{@board_hash[:C3]}'s win !!"
       play_again?
    elsif !@board_hash.has_value?('-')
      puts "Game over - it's a draw !"
      play_again?
    # else
    #   choose_space
    end
  end
end

# create Player class to allow turn input/space choice and to update/switch the
# active player
class Player
  attr_accessor :active_player

  def initialize
    @active_player = ['X','O'].sample
    puts "\nTime for Tic Tac Toe !"
    puts "#{@active_player}'s will go first..."
  end

  def switch_active_player
    case @active_player
    when 'X' then @active_player = 'O' # added "@active_player ="
    else @active_player = 'X' # added "@active_player ="
    end
  end
end

# Game class comment
class Game
  attr_reader :current_game

  def initialize
    @game_over = 0
    @current_game = Board.new
    @current_game.display_board
    @starting_player = Player.new
  end

  # def game_over
  #   @game_over = 1
  # end

  def choose_space
    puts 'Choose a space between A1 and C3 that has not been played yet:'
    @play = gets.chomp.upcase
  end

  def update_space
    begin
      #@turn = @current_game.board_hash.fetch_values(@play.to_sym)
      @turn = @current_game.board_hash.fetch_values(@play.to_sym) # note - this grabs an array, not just the value!
      puts @current_game.board_hash
      puts @current_game.board_hash.fetch_values(@play.to_sym)
      puts @turn.inspect
      puts @turn.class
      puts @turn[0]
      puts @starting_player.active_player
    rescue
      puts "#{@play} is invalid input..."
      # puts @play.inspect ## troubleshoot
      # puts @play.to_sym.inspect ## troubleshoot
      # puts @current_game.board_hash.inspect # troubleshoot
      choose_space # max three times then end game????
    else
      if @turn[0] != '-'
        puts 'Space already played. Choose again...'
        choose_space
      else @current_game.board_hash[@play.to_sym] = @starting_player.active_player
        @starting_player.switch_active_player # removed the 'active player between starting player and .switch_acive_player'
      end
    end
  end

  def play_game
    while @game_over == 0
      choose_space
      update_space
      @current_game.display_board
      @current_game.check_for_win
    end
    #play_again?
  end
end

active_game = Game.new
active_game.play_game

# array.sample
# single quotes preferred if no interpolation
# .to_s preferred to interpolation if only getting the hash value