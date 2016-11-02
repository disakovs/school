require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

p MESSAGES.inspect 
puts "Welcome to Calculator!"


def prompt(message)
  Kernel.puts("=> #{message}")
end 

first_number = ''
loop do
prompt("What is the first number?")
first_number = gets().chomp 

    if valid_number?(number1)
 
      break
    else 
      prompt("Hmm...doesnt look like the right input")
    end
  end
  
  second_number = ''
  loop do 
  prompt("What is the second number?")
  second_number = gets().chomp
  
  if valid_number?(number1)
      break
    else 
      prompt("Hmm...doesnt look like the right input")
    end
  end 
  
  prompt("What operation you would like to perform? 1) add 2) subtract 3) multiply 4) divide")
  operator = gets.chomp
  
  prompt(result)
  
  result = case operator
    when '1'
      result = first_number.to_i + second_number.to_i
    when '2'
      result = first_number.to_i - second_number.to_i
    when '3' 
      result = first_number.to_i * second_number.to_i
    when '4'
      result = first_number.to_f / second_number.to_f
  end
