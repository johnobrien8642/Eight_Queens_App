require 'set'
require 'solve_eight_queens'

class Chessboard
  include SolveEightQueens

  attr_reader :invalid_pos, :queen_pos
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '_') }
    @invalid_pos = Set.new
    @queen_pos = Set.new
  end

  def solve
      until @queen_pos.size == size + 1

          random_pos = pick_random_pos
          row = random_pos[0]
          col = random_pos[1]
          if @grid[row][col] != 'Q' && open_move?(random_pos, size )
              place_queen(random_pos)
              @queen_pos << random_pos
          elsif @grid[row][col] == 'Q' || !open_move?(random_pos, size)
              @invalid_pos << random_pos
          end
          if @invalid_pos.length == full_grid_count - @grid.length
              reset_grid
              @invalid_pos.clear
              @queen_pos.clear
          end
      end
      return @queen_pos.to_a
  end

  def size
      @grid.length - 1
  end

  def full_grid_count
      count = 0
      @grid.each { |row| count += row.count }
      count 
  end

  def reset_grid
      @grid.map! do |row|
          row.map! do |el|
              el = '_'
          end
      end
  end

  def pick_random_pos
      idx1 = rand(0...@grid.length)
      idx2 = rand(0...@grid.length)
      [ idx1, idx2 ]
  end

  def print
      @grid.each do |row|
          puts row.join(' ')
      end
  end

  def open_move?(position, grid_size)
      row = position[0]
      col = position[1]
      return false if queen_in_col?(col) || queen_in_row?(row) || queen_in_diagonal?(position, grid_size)
      true
  end

  def []=(pos, val)
      row, col = pos
      @grid[row][col] = val
      @diag_check_start_points = { 0=>[0,0]}
  end

  def place_queen(pos)
      row, col = pos
      @grid[row][col] = 'Q'
  end

  def is_queen?(pos)
      row, col = pos
      @grid[row][col] == 'Q'
  end

  def queen_in_row?(row)
     @grid[row].any? { |pos| pos == 'Q' }
  end

  def queen_in_col?(col)
      transposed = @grid.transpose
      transposed[col].any? { |pos| pos == 'Q' }
  end

  def queen_in_diagonal?(position, n)
      all_diagonals = (right_lower_diagonal(position, n) + 
                      right_upper_diagonal(position, n) + 
                      left_lower_diagonal(position, n) + 
                      left_upper_diagonal(position, n))
      all_diagonals.any? { |pos| is_queen?(pos) }
  end

  def right_lower_diagonal(position, n)
      row = position[0]
      col = position[1]
      diagonals = []
      until row == n || col == n
          diagonals << [ row += 1, col += 1 ]
      end
      diagonals
  end

  def right_upper_diagonal(position, n)
      row = position[0]
      col = position[1]
      diagonals = []
      until row == 0 || col == n
          diagonals << [ row -= 1, col += 1 ]
      end
      diagonals
  end

  def left_upper_diagonal(position, n)
      row = position[0]
      col = position[1]
      diagonals = []
      until row == 0 || col == 0
          diagonals << [ row -= 1, col -= 1 ]
      end
      diagonals
  end

  def left_lower_diagonal(position, n)
    row = position[0]
    col = position[1]
    diagonals = []
    until row == n || col == 0
        diagonals << [ row += 1, col -= 1 ]
    end
    diagonals
  end
end