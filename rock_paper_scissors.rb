# Rock Paper Scissors game

# this method is for consolidating the puts logic
def say(words)
  puts "==> #{words}"
end

# this method is called every time a new game is played. it instantiates all the
# necessary variables
def new_game()
  comp_move = ['rock', 'paper', 'scissors'].sample
  player_move = ""
  rock_paper_scissors(player_move, comp_move)
end

# this method is called to prompt the player for a choice and make sure it is one of the choices
def prompt_player(player_move)
  say "Choose rock, paper, or scissors"
  input = gets.chomp
  player_move.replace(input.downcase)
  if player_move == "rock" || player_move == "paper" || player_move == "scissors"
    return player_move
  else
    prompt_player("")
  end
end

# this method is called to assist in evaluating who wins
def choice_to_num(choice)
  if choice == 'paper'
    choice = 1
  elsif choice == 'rock'
    choice = 2
  elsif choice == 'scissors'
    choice = 3
  end
end

# this method is called to evaluate who wins
def evaluate(player, comp)
  value = (player % 3) - (comp % 3)
  if value == -1 || value == 2
    return 'win'
  elsif value == 1 || value == -2
    return 'lose'
  else
    return 'tie'
  end
end

# this method is called to print out the result to the user
def output(outcome, player, comp)
  puts ""
  if outcome == 'win'
    say "You choose #{player}, computer chose #{comp}. You win!"
  elsif outcome == 'lose'
    say "You chose #{player}, computer chose #{comp}. You lose..."
  else
    say "You both chose #{player}. Tie game."
  end
end

# this method combines all of the other methods. It is the program's backbone
def rock_paper_scissors(player_move, comp_move)
  puts "-------------------------------------"   # I don't want the hash rocket here so I use puts instead of say()
  say "Let's play some Rock Paper Scissors!"
  prompt_player(player_move)
  output(evaluate(choice_to_num(player_move), choice_to_num(comp_move)), player_move, comp_move)
  puts ""
  say "Would you like to play again? Type yes or no"
  play_again = gets.chomp
  if play_again.downcase == "yes"
    new_game
  else
    return
  end
end

# and of course, we need to start the game
new_game