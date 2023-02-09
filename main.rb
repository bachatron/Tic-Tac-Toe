class Board

  attr_accessor :empty_board

  def initialize
    @empty_board = Array(1..10)
  end

  def show_board
    puts "
    #{@empty_board[0]} #{@empty_board[1]} #{@empty_board[2]}
    #{@empty_board[3]} #{@empty_board[4]} #{@empty_board[5]}
    #{@empty_board[6]} #{@empty_board[7]} #{@empty_board[8]}
    "
  end

  def check_winner(symbol)
    if @empty_board[0..2] == symbol ||
       @empty_board[3..5] == symbol || 
       @empty_board[6..8] == symbol ||
       @empty_board[0] == symbol && @empty_board[4] == symbol && @empty_board[8] == symbol ||
       @empty_board[6] == symbol && @empty_board[4] == symbol && @empty_board[2] == symbol
end

new_board = Board.new
new_board.show_board