# rock_paper_scissors.rb

# rock paper scissors game with text user input

def say(words)
  puts "==> #{words}"
end

def new_game()
  comp_move = ['r', 'p', 's'].sample
  player_move = ""
  rock_paper_scissors(player_move, comp_move)
end

def player_choose(player_move)
  say "Choose R/P/S"
  input = gets.chomp
  player_move.replace(input)
  if player_move == "R" || player_move == "P" || player_move == "S"
    return player_move
  else
    player_choose(player_move)
  end
end

def rock_paper_scissors(player_move, comp_move)
  say "play rock paper scissors"
  player_choose(player_move)
  if player_move == 'R' && comp_move == 'r'
    say "You and computer both chose rock. Tie game"
  elsif player_move == 'R' and comp_move == 'p'
    say "You chose rock and computer chose paper. You lose"
  elsif player_move == 'R' && comp_move == 's'
    say "You chose rock and computer chose scissors. You win!"
  elsif player_move == 'P' && comp_move == 'r'
    say "You chose paper and computer chose rock. You win!"
  elsif player_move == 'P' && comp_move == 'p'
    say "You and computer both chose paper. Tie game"
  elsif player_move == 'P' && comp_move == 's'
    say "You chose paper and computer chose scissors. You lose..."
  elsif player_move == 'S' && comp_move == 'r'
    say "You chose scissors and computer chose rock. You lose..."
  elsif player_move == 'S' && comp_move == 'p'
    say "You chose scissors and computer chose paper. You win!"
  elsif player_move == 'S' && comp_move == 's'
    say "You and compute both chose scissors. Tie game"  
  end
  say "Would you like to play again? Type yes or no"
  play_again = gets.chomp
  if play_again.downcase == "yes"
    new_game
  else
    return
  end
end



# def evaluate(player, comp)
#   if [['r', 's'], ['p', 'r'], ['s', 'p']].include?([player.downcase[0], comp])
#     return 'win'
#   elsif [['s', 'r'], ['r', 'p'], ['p', 's']].include?([player.downcase[0], comp])
#     return 'lose'
#   else
#     return 'tie'
#   end
# end

# def output(outcome)
#   if outcome == 'win'
#     puts "You win!"
#   elsif outcome == 'lose'
#     puts "You lose..."
#   else
#     puts "Tie game"
#   end
# end

# def rock_paper_scissors(comp_move)
#   say "Let's play some Rock Paper Scissors!"
#   say "-------------------------------------"
#   say "Choose rock, paper, or scissors"
#   player_move = gets.chomp
#   output(evaluate(player_move, comp_move))
#   say "Would you like to play again? Type yes or no"
#   play_again = gets.chomp
#   if play_again.downcase == "yes"
#     new_game
#   else
#     return
#   end
# end

new_game
