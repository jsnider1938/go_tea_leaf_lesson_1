# calc_app.rb
#
# a simple calulator app with a bit of user input
#
#

# require "pry"

def say(msg)
  puts "#{msg}"
end

say "What's the first number"
num = gets.chomp

say "What's the operator? ADD, SUBTRACT, MULTIPLY, or DIVIDE?"
operator = gets.chomp

say "What's the second number?"
num_2 = gets.chomp

# binding.pry

answer = case
when operator == "ADD"
  operator = "plus"
  num.to_i + num_2.to_i
when operator == "SUBTRACT"
  operator = "minus"
  num.to_i - num_2.to_i
when operator == "MULTIPLY"
  operator = "times"
  num.to_i * num_2.to_i
when operator == "DIVIDE"
  operator = "divided by"
  num.to_f / num_2.to_f
end

say "#{num} #{operator} #{num_2}.  The answer is #{answer}"