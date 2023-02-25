require "./conditions.rb"

class Board

  attr_accessor :empty_board, :game_over

  def initialize
    @empty_board = Array(1..9)
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
    elsif tie_condition(@empty_board)
      puts "It's a tie."
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

  def make_a_play(board)
    puts "#{@name} select where to move"
    move_condition(board, @icon)
  end

  def get_icon
    puts "#{@name} what icon will you use?"
    icon = gets.chomp
    until icon.length == 1 && ('a'..'z').include?(icon.downcase)
      puts "Icon must be a 1 letter."
      icon = gets.chomp
    end
    icon
  end

  def test(board)
    board.show_board
    puts "TEST"
  end

end

def play()
  p1 = Player.new(1)
  p2 = Player.new(2)
  new_board = Board.new
  until new_board.game_over
    player_actions(new_board, p1)
    break if new_board.game_over
    player_actions(new_board, p2)
  end
end

play()
    
