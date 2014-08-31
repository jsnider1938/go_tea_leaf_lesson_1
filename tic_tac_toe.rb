
def draw_board(a)
  system "clear"
  puts "      |     |     "
  puts "   #{a[0]}  |  #{a[1]}  |  #{a[2]}  " 
  puts "      |     |     "
  puts "------+-----+-----"
  puts "      |     |     "
  puts "   #{a[3]}  |  #{a[4]}  |  #{a[5]}  "
  puts "      |     |     "
  puts "------+-----+-----"     
  puts "      |     |     "
  puts "   #{a[6]}  |  #{a[7]}  |  #{a[8]}  "
  puts "      |     |     "
end

def check_if_game_over(soon_to_be_wins)
  if soon_to_be_wins.has_value?(['X', 'X', 'X'])
    puts "You win!"
    return true
  elsif soon_to_be_wins.has_value?(['O', 'O', 'O'])
    puts "Computer wins"
    return true
  elsif !soon_to_be_wins.values.flatten.include?('nil')
    puts "Cats game. It's a tie."
    return true
  else
    return false
  end
end

loop do
  vars = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  draw_board(vars)
  soon_to_be_wins = {[1, 2, 3] => ['nil', 'nil', 'nil'], [4, 5, 6] => ['nil', 'nil', 'nil'], [7, 8, 9] => ['nil', 'nil', 'nil'], [5, 9, 1] => ['nil', 'nil', 'nil'], [3, 5, 7] => ['nil', 'nil', 'nil'],
   [4, 1, 7] => ['nil', 'nil', 'nil'],[2, 5, 8] => ['nil', 'nil', 'nil'], [9, 6, 3] => ['nil', 'nil', 'nil']}
  #player chooses and adds to board
  loop do
    draw_board(vars)
    break if check_if_game_over(soon_to_be_wins)
    puts "Choose a position from 1 to 9 to place a piece:"
    begin
      player_move = gets.chomp.to_i
    end until (vars[(player_move - 1)] == " ") && player_move != 0
    vars[(player_move - 1)] = "X"
    soon_to_be_wins.each do |k, v|
      if k.include?(player_move)
        v[k.index(player_move)] = 'X'
      end
    end
    draw_board(vars)
    break if check_if_game_over(soon_to_be_wins)
    # computer chooses and adds to board
    case
    when soon_to_be_wins.has_value?(['O', 'nil', 'O']) || soon_to_be_wins.has_value?(['O', 'O', 'nil']) || soon_to_be_wins.has_value?(['nil', 'O', 'O'])   # first checks if comp can win
      soon_to_be_wins.each do |k, v|
        if (v.count('O') == 2) && (v.count('X') == 0)   #if o about to win
          space = k[v.index('nil')]
          vars[space - 1] = 'O' # changes the space to 'O' in vars master record
          soon_to_be_wins.each do |key, value| #changing all spaces in possible solutions list
            if key.include?(space)
              value[key.index(space)] = 'O'
            end
          end
          break
        end
      end
    when soon_to_be_wins.has_value?(['X', 'nil', 'X']) || soon_to_be_wins.has_value?(['X', 'X', 'nil']) || soon_to_be_wins.has_value?(['nil', 'X', 'X'])  # then checks if player is going to win => tries to block
      soon_to_be_wins.each do |k, v|
        if (v.count('X') == 2) && (v.count('O') == 0)   #if x about to win
          space = k[v.index('nil')]
          vars[space - 1] = 'O' # changes the space to 'O' in vars master record
          soon_to_be_wins.each do |key, value| #changing all spaces in possible solutions list
            if key.include?(space)
              value[key.index(space)] = 'O'
            end
          end
          break
        end
      end
    when soon_to_be_wins.has_value?(['O', 'nil', 'nil']) || soon_to_be_wins.has_value?(['nil', 'O', 'nil']) || soon_to_be_wins.has_value?(['nil', 'nil', 'O'])   # tries to add to its attempt to win
      soon_to_be_wins.each do |k, v|
        if (v.count('O') == 1) && (v.count('X') == 0)   #if x about to win
          space = k[v.index('nil')]
          vars[space - 1] = 'O' # changes the space to 'O' in vars master record
          soon_to_be_wins.each do |key, value| #changing all spaces in possible solutions list
            if key.include?(space)
              value[key.index(space)] = 'O'
            end
          end
          break
        end
      end 
    when soon_to_be_wins.has_value?(['nil', 'nil', 'nil'])   # if all attempts are nonexistent, starts another
      soon_to_be_wins.to_a.shuffle.to_h.each do |k, v|
        if (v.count('O') == 0) && (v.count('X') == 0)   #if x about to win
          space = k[v.index('nil')]
          vars[space - 1] = 'O' # changes the space to 'O' in vars master record
          soon_to_be_wins.each do |key, value| #changing all spaces in possible solutions list
            if key.include?(space)
              value[key.index(space)] = 'O'
            end
          end
          break
        end
      end
    else
      soon_to_be_wins.each do |k, v|
        if v.include?('nil')
          space = k[v.index('nil')]
          vars[space - 1] = 'O' # changes the space to 'O' in vars master record
          soon_to_be_wins.each do |key, value| #changing all spaces in possible solutions list
            if key.include?(space)
              value[key.index(space)] = 'O'
            end
          end
          break
        end
      end
    end
  end

  puts "Play again? (y/n)"
  repeat = gets.chomp
  break if repeat.downcase[0] != 'y'
  system "clear"

end

puts "Goodbye"