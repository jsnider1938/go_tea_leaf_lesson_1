puts "What's the first number"
num = gets.chomp.to_f

puts "What's the operator? ADD, SUBTRACT, MULTIPLY, or DIVIDE?"
operator = gets.chomp

puts "What's the second number?"
num_2 = gets.chomp.to_f

answer = case
when operator == "ADD"
  num + num_2
when operator == "SUBTRACT"
  num - num_2
when operator == "MULTIPLY"
  num * num_2
when operator == "DIVIDE"
  num / num_2
end

puts "The answer is #{answer}"