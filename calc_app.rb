# calc_app.rb
#
# a simple calulator app with a bit of user input
#
#

def say(msg)
  puts "#{msg}"
end

say "What's the first number"
num = gets.chomp.to_i

say "What's the operator? ADD, SUBTRACT, MULTIPLY, or DIVIDE?"
operator = gets.chomp

say "What's the second number?"
num_2 = gets.chomp.to_i

answer = case
when operator == "ADD"
  operator = "plus"
  num + num_2
when operator == "SUBTRACT"
  operator = "minus"
  num - num_2
when operator == "MULTIPLY"
  operator = "times"
  num * num_2
when operator == "DIVIDE"
  operator = "divided by"
  num / num_2
end

say "#{num} #{operator} #{num_2}.  The answer is #{answer}"