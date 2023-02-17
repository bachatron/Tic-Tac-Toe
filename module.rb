def win_condition(array, icon)
  combinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  combinations.any? do |comb|
    array.values_at(comb[0], comb[1], comb[2]) == [icon, icon, icon]
  end
end
