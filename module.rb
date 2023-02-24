def win_condition(array, icon)
  combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  combinations.any? do |comb|
    array.values_at(comb[0], comb[1], comb[2]) == [icon, icon, icon]
  end
end

def tie_condition(board)
  board.all?(String)
end

def move_condition(board, icon)
  loop do
    move = gets.chomp.to_i
    if Array(1..9).include?(move) && board[move-1] == move
      board[move-1] = icon
      break
    end
    puts 'Invalid input. Select a valid position.'
  end
end
