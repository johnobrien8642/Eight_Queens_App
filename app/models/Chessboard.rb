require 'set'
require_relative '../../lib/positions'
require_relative '../../lib/solve_eight_queens'

#This is a demonstration to showcase my OOP skills.
#I've also taken extra care to try to make my code
#as readable as possible.

#My first attempt at #solve and ::Chessboard can be found in the 
#non-oop-fast-version branch and was much faster than this
#version. I've refactored this method to focus on readability
#and to showcase my OOP skills. I'm not exactly sure why
#refactoring of #solve and ::Chessboard to be OOP is slowing down
#the method so much, although I think it's probably
#due to the amount of new objects being instantiated
#during each iteration. If performance were a concern
#for a method I might not choose to utilize OOP as heavily
#if it was going to slow the method down considerably.

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