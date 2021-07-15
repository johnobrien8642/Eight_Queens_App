require 'set'
require_relative '../../lib/positions'
require_relative '../../lib/solve_eight_queens'

#This is a demonstration to showcase my OOP skills.
#I've also taken extra care to try to make my code
#as readable as possible.
class Chessboard
	include SolveEightQueens
	
  def initialize
  	@grid = Array.new(8) { Array.new(8, Token.new('_')) }
		@positions = Positions.new
  end
	
	attr_accessor :grid

  def solve
    until solved
			try_to_place_another_queen

			if no_more_possible_moves? then reset end
    end
		@positions.queens.to_a
  end
end