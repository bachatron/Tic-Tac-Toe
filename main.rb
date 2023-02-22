require "./module.rb"

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

  def check_winner(player)
    if win_condition(@empty_board, player.icon)
      puts "#{player.name} win."
      @game_over = true
    end
  end
  
end

class Player

  attr_reader :name, :icon

  def initialize(number)
    @name = "Player #{number}"
    @icon = get_icon
  end

  def make_a_play(board, move)
    if Array(1..9).include?(move.to_i)
      board[move.to_i - 1] = @icon
    else
      puts 'Invalid move'
    end
  end

  def get_icon
    puts "#{@name} what icon will you use?"
    icon = gets.chomp
    until icon.length == 1
      puts "Please just 1 character"
      icon = gets.chomp
    end
    icon
  end

end

def play()
  p1 = Player.new(1)
  p2 = Player.new(2)
  new_board = Board.new
  new_board.show_board
  until new_board.game_over
    puts "#{p1.name} select where to move"
    p1.make_a_play(new_board.empty_board, gets.chomp)
    new_board.show_board
    new_board.check_winner(p1)
    break if new_board.game_over
    puts "#{p2.name} select where to move"
    p2.make_a_play(new_board.empty_board, gets.chomp)
    new_board.show_board
    new_board.check_winner(p2)
  end
end

play()
    
