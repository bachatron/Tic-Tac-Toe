class Board

  attr_accessor :empty_board, :game_over

  def initialize
    @empty_board = Array(1..10)
    @game_over = false
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
       @empty_board[6] == symbol && @empty_board[4] == symbol && @empty_board[2] == symbol ||
       @empty_board[0] == symbol && @empty_board[3] == symbol && @empty_board[6] == symbol ||
       @empty_board[1] == symbol && @empty_board[4] == symbol && @empty_board[7] == symbol ||
       @empty_board[2] == symbol && @empty_board[5] == symbol && @empty_board[8] == symbol
        @game_over = true
        puts "Player #{symbol} won."
    end
  end

end

class Player

  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end

  def make_play(board, move)
    board[move-1] = @symbol
  end

end


new_board.show_board
player1 = Player.new("bach", "B")
player1.make_play(new_board.empty_board, 1)
player1.make_play(new_board.empty_board, 5)
player1.make_play(new_board.empty_board, 9)
new_board.show_board
new_board.check_winner(player1.symbol)

def play
  new_board = Board.new
  players = []
