
puts "Welcome to Calculator!"

puts "What is the first number?"
first_number = gets().chomp 

puts "What is the second number?"
second_number = gets().chomp

puts "What operation you would like to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = first_number.to_i + second_number.to_i 
elsif operator == '2'
  result = first_number.to_i - second_number.to_i 
elsif operator == '3'
  result = first_number.to_i * second_number.to_i 
else operator == '4'
  result = first_number.to_f / second_number.to_f 
end

puts result 