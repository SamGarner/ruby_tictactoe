# frozen_string_literal: false

require_relative './tictac/board.rb'
require_relative './tictac/player.rb'
require_relative './tictac/game.rb'

active_game = Game.new
active_game.play_game

# lessons:::
# array.sample - returns a random element or n random elements from the array
# single quotes preferred if no interpolation
# .to_s preferred to interpolation if only getting the hash value
# to check that 3,4, + items all the same...can put them in an array together and then
#   check that the length of uniq items is 1 - used for checking for winning combos
# switch_active_player method 'direct assignment' -- see rubocop note: Check for
# if and case statements where each branch is used for assignment to the same variable when using the return of the condition can be used instead.
# '@game_over = 1 if @current_game.check_for_win != 1' providing output and updating variable in one line
# Hash.value? preferable to Hash.has_value?
