# frozen_string_literal: false

# represents a single TicTac game
class Game
  attr_accessor :players_turn, :space1

  def initialize
    @space1 = 0
    @space2 = 0
    @space3 = 0
    @space4 = 0
    @space5 = 0
    @space6 = 0
    @space7 = 0
    @space8 = 0
    @space9 = 0
    @players_turn = "X"
  
    puts @players_turn
    puts "#{@players_turn}\'s turn. Enter a number 1-9 to choose your space:"
    choice = gets.chomp.to_i
    case choice
    when 1
      @space1 = @players_turn
    when 2
      @space2 = @players_turn
    when 3
      @space3 = @players_turn
    else
      puts 'Invalid input. Please enter a number 1-9'
    end

  #end
    # Game Over Check Loop
    #def GameOver
      if @space1 == @space2 == @space3 != 0
        puts "Game over! #{@space1}'s win!!"
      elsif @space1 == 0 || @space2 == 0 || @space3 == 0
        case @players_turn
        when "X"
          @players_turn = "O"
        else
          @players_turn = "X"
        end
        puts "#{@players_turn}\'s turn. Enter a number 1-9 to choose your space:"
      else
        puts "Game over! Tie :("
      end
    end

  # def take_turn
  #   puts "Player#@players_turn\'s turn. Enter a number 1-9 to choose your space:"
  # end
end

Game.new
#puts @players_turn
#puts "Player#@players_turn.to_s\'s turn. Enter a number 1-9 to choose your space:"


# methods:
# player1turn
# -mark board and check win condition
# player2turn
# -check result
