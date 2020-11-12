# frozen_string_literal: false

# Game class comment
class Game

  def initialize
    @game_over = 0
    @current_game = Board.new
    @current_game.display_board
    @starting_player = Player.new
  end

  def choose_space
    puts "\n#{@starting_player.active_player}'s turn..."
    puts 'Choose a space between A1 and C3 that has not been played yet:'
    @play = gets.chomp.upcase
  end

  def update_space
    begin
      @turn = @current_game.board_hash.fetch_values(@play.to_sym) # note - this grabs an array of value(s), not just the value!
    rescue
      puts "\n#{@play} is invalid input... Try again:\n\n"
    else
      if @turn[0] != '-'
        puts "\nSpace already played. Choose again...\n\n"
      else @current_game.board_hash[@play.to_sym] = @starting_player.active_player
        @starting_player.switch_active_player
      end
    end
  end

  def play_again?
    puts "Type 'y' if you would like to play again and any other key to exit :"
    @play_again = gets.chomp.downcase
    case @play_again
    when 'y'
      active_game = Game.new
      active_game.play_game
    end
  end

  def play_game
    while @game_over == 0
      choose_space
      update_space
      @current_game.display_board
      @game_over = 1 if @current_game.check_for_win != 1
    end
    play_again?
  end
end
