require "pry"

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
  if soon_to_be_wins.has_key?(['X', 'X', 'X'])
    puts "You win!"
    return true
  elsif soon_to_be_wins.has_key?(['O', 'O', 'O'])
    puts "Computer wins"
    return true
  else
    return false
  end
end

# draw_board([1, 2, 3, 4, 5, 6, 7, 8, 9])
loop do
  vars = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  draw_board(vars)
  soon_to_be_wins = {[1, 2, 3] => ['nil', 'nil', 'nil'], [4, 5, 6] => ['nil', 'nil', 'nil'], [7, 8, 9] => ['nil', 'nil', 'nil'], [1, 5, 9] => ['nil', 'nil', 'nil'],
   [1, 4, 7] => ['nil', 'nil', 'nil'],[2, 5, 8] => ['nil', 'nil', 'nil'], [3, 6, 9] => ['nil', 'nil', 'nil'], [4, 5, 6] => ['nil', 'nil', 'nil']}
  #player chooses and adds to board
  loop do
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
    # computer chooses and adds to board
    pass = false
    soon_to_be_wins.each do |k, v|              # checking for X about to win
      if (v.count('X') == 2) && (v.count('O') != 1)  
        space = k[v.index('nil')]
        vars[space - 1] = 'O' # changes the space to 'O' in vars master record
        soon_to_be_wins.each do |key, value| #changing all spaces in possible solutions list
          if key.include?(space)
            value[key.index(space)] = 'O'
          end
        end
        pass = true
        break
      end
      break if pass
    end
    soon_to_be_wins.each do |k, v|              # checking for only one O
      if (v.count('O') == 1) && (v.count('X') != 1) 
        space = k[v.index('nil')]
        vars[space - 1] = 'O' # changes the space to 'O' in vars master record
        soon_to_be_wins.each do |key, value|
          if key.include?(space)
            value[key.index(space)] = 'O'
          end
        end
        pass = true
        break
      end
      break if pass
    end
    soon_to_be_wins.each do |k, v|              # checking for two O's
      if (v.count('O') == 2) && (v.count('X') != 0) 
        space = k[v.index('nil')]
        vars[space - 1] = 'O' # changes the space to 'O' in vars master record
        soon_to_be_wins.each do |key, value|
          if key.include?(space)
            value[key.index(space)] = 'O'
          end
        end
        pass = true
        break
      end
      break if pass
    end
    soon_to_be_wins.each do |k, v|              # attempt a new 3-in-a-row 
        space = k[v.index('nil')]
        vars[space - 1] = 'O' # changes the space to 'O' in vars master record
        soon_to_be_wins.each do |key, value|
          if key.include?(space)
            value[key.index(space)] = 'O'
          end
        end
        break
    end
    draw_board(vars)
    break if check_if_game_over(soon_to_be_wins)
  end

  puts "Play again? (y/n)"
  repeat = gets.chomp
  break if repeat.downcase[0] != 'y'
  system "clear"

end

puts "Goodbye"