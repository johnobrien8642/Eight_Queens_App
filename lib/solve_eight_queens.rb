module SolveEightQueens
  def solved
    @positions.queens.size == 8
  end

  def try_to_place_another_queen
		@positions.generate_new_random_position

		if open_move?(*@positions.random_position)
			place_queen
			@positions.queens << @positions.random_position
		else 
			@positions.invalids << @positions.random_position
		end
	end

  def open_move?(row, col)
    @positions.random_position_is_vacant?(@grid) &&
    no_queens_in_col?(col) &&
    no_queens_in_row?(row) && 
    no_queens_in_diagonal?(row, col)
  end

	def no_more_possible_moves?
		available_open_moves_less_than_required?
	end

  def available_open_moves_less_than_required?
		@positions.invalids.size == ((@grid.length * 2) - @grid.length)
	end

	def reset
		reset_grid
		reset_positions
	end

	def reset_grid
		@grid = Array.new(8) { Array.new(8, Token.new('_')) }
	end

	def reset_positions
		@positions = Positions.new
	end

  def place_queen
		row, col = @positions.random_position
    @grid[row][col] = Token.new('Q')
  end

  def no_queens_in_row?(row)
    @grid[row].none?(&:queen?)
  end

  def no_queens_in_col?(col)
    transposed = @grid.transpose
    transposed[col].none?(&:queen?)
  end

  def no_queens_in_diagonal?(row, col)
      all_diagonals = (
				right_lower_diagonal(row, col) + 
        right_upper_diagonal(row, col) + 
        left_lower_diagonal(row, col) +
        left_upper_diagonal(row, col)
			)
      all_diagonals.none? { |pos| @grid[pos[0]][pos[1]].queen? }
  end

  def right_lower_diagonal(row, col)
      diagonals = []
      until row == 7 || col == 7
          diagonals << [ row += 1, col += 1 ]
      end
      diagonals
  end

  def right_upper_diagonal(row, col)
      diagonals = []
      until row == 0 || col == 7
          diagonals << [ row -= 1, col += 1 ]
      end
      diagonals
  end

  def left_upper_diagonal(row, col)
      diagonals = []
      until row == 0 || col == 0
          diagonals << [ row -= 1, col -= 1 ]
      end
      diagonals
  end

  def left_lower_diagonal(row, col)
    diagonals = []
    until row == 7 || col == 0
        diagonals << [ row += 1, col -= 1 ]
    end
    diagonals
  end
end