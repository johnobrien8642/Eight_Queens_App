class ChessboardController < ApplicationController
  def solution
    @board = Chessboard.new
    @solution = @board.solve
    render json: @solution
  end
end