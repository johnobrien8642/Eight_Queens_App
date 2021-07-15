require 'set'
require_relative 'token'

class Positions

  def initialize
    @invalids = Set.new
    @queens = Set.new
    @random_position ||= []
  end

  attr_reader :invalids, :queens, :random_position


  def generate_new_random_position
    idx1 = rand(0...8)
    idx2 = rand(0...8)
    @random_position = [ idx1, idx2 ]
  end

  def random_position_is_vacant?(grid)
    row, col = @random_position
    grid[row][col].empty?
  end
end