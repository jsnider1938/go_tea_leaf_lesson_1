# rock_paper_scissors.rb

# rock paper scissors game with text user input

def say(words)
  puts "==> #{words}"
end

def new_game()
  computer_move = ['r', 'p', 's'].sample
  rock_paper_scissors(computer_move)
end

def evaluate(player, comp)
  if [['r', 's'], ['p', 'r'], ['s', 'p']].include?([player.downcase[0], comp])
    return 'win'
  elsif [['s', 'r'], ['r', 'p'], ['p', 's']].include?([player.downcase[0], comp])
    return 'lose'
  else
    return 'tie'
  end
end

def output(outcome)
  if outcome == 'win'
    puts "You win!"
  elsif outcome == 'lose'
    puts "You lose..."
  else
    puts "Tie game"
  end
end

def rock_paper_scissors(comp_move)
  say "Let's play some Rock Paper Scissors!"
  say "-------------------------------------"
  say "Choose rock, paper, or scissors"
  player_move = gets.chomp
  output(evaluate(player_move, comp_move))
  say "Would you like to play again? Type yes or no"
  play_again = gets.chomp
  if play_again.downcase == "yes"
    new_game
  else
    return
  end
end

new_game
