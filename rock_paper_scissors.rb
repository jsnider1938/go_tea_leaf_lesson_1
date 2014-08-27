CHOICES = {'p' => 'PAPER', 'r' => 'ROCK', 's' => 'SCISSORS'}

puts "Welcome to Rock, Paper, Scissors"

def display_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper wraps rock"
  when 'r'
    puts "Rock smashes scissors"
  when 's'
    puts "scissors cuts paper"
  end
end

loop do
  # player makes a pick
  begin
    puts "Pick one: (r, p, s)"
    player_choice = gets.chomp
  end until CHOICES.has_key?(player_choice)

  # computer makes a pick
  computer_choice = CHOICES.keys.sample

  # compare
  # 
  if player_choice == computer_choice
    puts "It's a tie"
  elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 
    's') || (player_choice == 's' && computer_choice == 'p')
    display_winning_message(player_choice)
    puts "You won"
  else
    display_winning_message(computer_choice)
    puts "Computer won"
  end

  puts "Play again? (y/n)"
  break if gets.chomp.downcase != 'y'

end

puts "Goodbye!"