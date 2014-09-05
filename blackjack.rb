require "pry"

def shuffle_deck(num)   # puts x number of decks into continuous shuffling machine and shuffles the cards
  shuffling_machine = []
  num.times do |i|
    full_deck = {'AS' => 11, '2S' => 2, '3S' => 3, '4S' => 4, '5S' => 5, '6S' => 6, '7S' => 7, '8S' => 8, '9S' => 9, '10S' => 10, 'JS' => 10, 'QS' => 10, 'KS' => 10,
          'AH' => 11, '2H' => 2, '3H' => 3, '4H' => 4, '5H' => 5, '6H' => 6, '7H' => 7, '8H' => 8, '9H' => 9, '10H' => 10, 'JH' => 10, 'QH' => 10, 'KH' => 10,
          'AC' => 11, '2C' => 2, '3C' => 3, '4C' => 4, '5C' => 5, '6C' => 6, '7C' => 7, '8C' => 8, '9C' => 9, '10C' => 10, 'JC' => 10, 'QC' => 10, 'KC' => 10,
          'AD' => 11, '2D' => 2, '3D' => 3, '4D' => 4, '5D' => 5, '6D' => 6, '7D' => 7, '8D' => 8, '9D' => 9, '10D' => 10, 'JD' => 10, 'QD' => 10, 'KD' => 10
          }
    shuffling_machine.unshift(full_deck.to_a.shuffle.to_h)
    binding.pry
  end
  return shuffling_machine # deck.shuffle
end

def draw_card(hand, shuffling_machine, num_of_decks)    # adds a card to player/computer hand
  which_deck = rand(1..num_of_decks)
  card = shuffling_machine[which_deck - 1].to_a.pop
  hand.store(card[0], card[1])
end

def hand_value(hand)        # determines players/computers hand value
  sum = hand.values.inject{|sum,x| sum + x }
  if (sum > 21) && ( hand.has_key?('AS') || hand.has_key?('AH') || hand.has_key?('AC') || hand.has_key?('AD') )
    hand.keys.each do |card|
      if card == 'AS' || card == 'AH' || card == 'AC' || card == 'AD'
        sum -= 10
        break if sum <= 21
      end
    end
  end
  return sum
end

def display_scores(name, player, computer, money, result)   # prints to screen hand outcome
  print "You: "
  player.keys.each {|i| print i + ' '}
  puts "==> #{hand_value(player)}"
  sleep(0.75)
  if result != 'You bust'
    print "Computer: "
    computer.keys.each {|i| print i + ' '}
    puts "==> #{hand_value(computer)}"
  end
  puts "#{result}, #{name}"
  puts "You now have #{money[0]}."
end

def update_money(money, bet, win)     # removes or adds to players money depending on bet and if she won
  current_money = money[0]
  money.pop
  if win
    current_money += bet
  else
    current_money -= bet
  end
  money << current_money
end

def assess_who_wins(name, player, computer, money, bet)     # finds out who won the hand
  if hand_value(player) > 21
    update_money(money, bet, false)
    display_scores(name, player, computer, money, 'You bust')
  elsif hand_value(computer) > 21
    update_money(money, bet, true)
    display_scores(name, player, computer, money, 'Computer busts. You win')
  elsif hand_value(player) == hand_value(computer)
    display_scores(name, player, computer, money, 'Tie game')
  elsif hand_value(player) > hand_value(computer)
    update_money(money, bet, true)
    display_scores(name, player, computer, money, 'You win')
  elsif hand_value(player) < hand_value(computer)
    update_money(money, bet, false)
    display_scores(name, player, computer, money, 'Computer wins')
  end
end

def end_game?(money)      # asks player if she wants to keep playing (if she even has the money)
  if money[0] <= 0
    puts "You're out of money."
    return true
  else
    puts "Play again? y/n"
    answer = gets.chomp
    return true if answer.downcase[0] != 'y'
  end
end

system "clear"                                      #these lines are run when a player 'sits down at the table'
puts "Welcome to the table. What's your name?"      # 
name = gets.chomp                                   #
sleep(0.75)                                         #
money = [100]                                       #
loop do        # this is equal to playing a hand
  puts "How many decks do you want in the Continuous Shuffling Machine?"    # asks player how many decks to prevent counting cards
  begin
    num_of_decks = gets.chomp.to_i
  end until num_of_decks > 0
  shuffling_machine = shuffle_deck(num_of_decks)
  player_hand = {}
  computer_hand = {}
  player_stay = false
  puts "Alright #{name}, you have #{money[0]}. How much do you want to bet this round?"
  begin
    bet = gets.chomp.to_i     # prompts player for bet
  end until bet <= money[0] && bet > 0
  2.times { |i| draw_card(player_hand, shuffling_machine, num_of_decks) }      # deal player 2 cards
  begin     # player hit/stay cycle
    print "Your hand: "
    player_hand.keys.each {|i| print i + ' '}
    puts "==> #{hand_value(player_hand)}"
    puts "What would you like to do? (hit/stay)"
    response = gets.chomp
    if response == 'hit' && hand_value(player_hand) <= 21
      draw_card(player_hand, shuffling_machine, num_of_decks)
    elsif response == 'stay'
      player_stay = true
    end
  end until player_stay or hand_value(player_hand) > 21
  begin                                                         # computer hit/stay cycle
  draw_card(computer_hand, shuffling_machine, num_of_decks)     # deal computer 2 cards
  end until hand_value(computer_hand) >= 17
  assess_who_wins(name, player_hand, computer_hand, money, bet) # figure out who wins the hand
  break if end_game?(money)   # asks if player wants to play again
  system "clear"
end

puts "Goodbye"

