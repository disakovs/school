def rotate_array(array)
  a = array
  a << a.shift 
end


def rotate_rightmost_digits(number, n)
  array = number.to_s.chars 
  last_part = rotate_array(array[-n..-1])
  new_array = array[0...-n] + last_part
  new_array.join.to_i 
end

def max_rotation(number)
  array = number.to_s.chars
  new_array = []
  (array.size - 1).times do |i|
    rotate_array(array)
    new_array << array.shift 
  end
(new_array + array).join.to_i
end

##########lights 

def initialize_hash(size)
  hash = {}
  size.times { |i| hash[i] = "on" }
  hash 
end

def switch(current_state)
  current_state == 'on' ? 'off' : 'on'
end

def turn_lights(light_number)
  hash = initialize_hash(light_number)
  (2..light_number).each do |i|
    hash.each { |k, v| hash[k] = switch(v) if k % i == 0 }
  end
  hash.select { |k, v| hash[k] == 'on' }
end 

#######diamond

def top_half_array(number)
  array = []
  (1..((number + 1)/2)).each do |i|
    array << ('*' * (i * 2 - 1)).center(number)
  end
  array 
end

def diamond_array(number)
  half = top_half_array(number)
  bottom_half = half[0..-2].reverse
  half + bottom_half
end
    
def diamond(number)
  diamond_array(number).each { |line| puts line }
end


#word to digit

WORD_DIGITS = { 'one' => '1', 
                'two' => '2',
                'three' => '3',
                'four' => '4',
                'five' => '5',
                'six' => '6',
                'seven' => '7',
                'eight' => '8',
                'nine' => '9',
              }.freeze

def word_to_digit(sentence)
  WORD_DIGITS.keys.each do |word_number|
  sentence.gsub!(/\b#{word_number}\b/, WORD_DIGITS[word_number])
  end
  sentence
end

#fibonacci

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

def fibonacci(num)
  return 1 if num == 1 || num == 2
  fibonacci(num - 1) + fibonacci(num - 2)
end 

def fibonacci(num)
  fibonacci_array = [1, 1]
  (2..num - 1).each do |i|
    fibonacci_array << fibonacci_array[i - 1] + fibonacci_array[i - 2] 
  end
  fibonacci_array.last 
end

def fibonacci(num)
  first, last = [1, 1]
  3.upto(num) do 
    first, last = [last, first + last]
  end
  last
end

def fibonacci_last(num)
  number = fibonacci(num)
  (number.to_s)[-1].to_i 
end

def fibonacci_last(nth)
  last_2 = [1, 1]
  3.upto(nth) do
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
    
  end

  last_2.last
end

def twice(num)
   half = num.to_s.length/2
   if num.to_s[0...half] == num.to_s[half..-1]
     num
   else
     num * 2
   end
end
 
def negative(num)
  num < 0 ? num : -num 
end 

def sequence(number)
  if number < 0 
    (number..0).to_a
  else
    (1..number).to_a
end
end

def into_sentences(input)
  input.split(/\.|\?|!/)
end

#block_word

BLOCKS = %w( B:O   X:K   D:Q   C:P
             N:A G:T   R:E   F:S   
             J:W   H:U V:I   L:Y   Z:M).freeze 

def block_word?(string)
 index_array = []
 string.upcase.chars.each do |letter| 
    BLOCKS.each do |block|
      index_array << BLOCKS.index(block) if block.include? letter
    end
  end
  index_array == index_array.uniq ? true : false 
end

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end 

# how many?
vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

def count_occurrences(array)
  hash = array.group_by { |i| i }
  hash.each { |k, v| puts "#{k} => #{v.length}" } 
end

#reverse it part 2

def reverse_words(string)
  string_array = []
  string.split.map do |word| 
    if word.length > 5
      string_array << word.reverse!
    else
      string_array << word
    end
  end
  string_array.join(' ')
end

# stringy

def stringy(number)
  answer = "10" * (number/2)
  answer += "1" if number.odd?
  answer 
end


# average

def average(array)
  array.reduce(:+)/array.size.to_f 
end


# sum of digits

def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

# mult average

def show_multiplicative_average(array)
  answer = array.reduce(:*)/array.size.to_f
  format('%.3f', answer)
end
  
# multiply lists

def multiply_list(array1, array2)
  new_array = []
  (0...array1.size).each do |i|
    new_array << array1[i]*array2[i]
  end
  new_array
end

def multiply_list(array1, array2)
  array1.zip(array2).map { |group| group.reduce(:*) }
end

# century

def century(year)
  century = (year/(100.to_f)).ceil 
  
end

#percantage ratio

def letter_percentages(string)
  hash = {} 
  string_size = string.length
  hash[:lowercase] = string.count('a-z')
  hash[:uppercase] = string.count('A-Z')
  hash[:neither] = string.count('^a-zA-Z')
  hash.map { |k, v| p hash[k] = v / string_size.to_f * 100 }
  hash 
end

# Matching Parentheses?

PARANTHESES = '()'

def balanced?(string)
  just_parentheses = string.gsub(/[^()]/, '')
  just_parentheses.gsub!(/\(\)/, '')
  just_parentheses.empty? ? true : false 
end

# triangle angles

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]
  
  case 
  when angles.reduce(:+) != 180 || angles.include?(0) then :invalid 
  when angles.all? { |i| i < 90 } then :acute
  when angles.any? { |i| i == 90 } then :right
  else  
    :obtuse
  end
end

#friday_13th
require 'date'
def friday_13th?(yr)
  unlucky_count = 0
  thirteen = Date.new(yr, 1, 13)
  11.times do 
    unlucky_count += 1 if thirteen.friday?
    thirteen = thirteen.next_month
  end
  unlucky_count
end
  
#featured

def featured(n)
  n += 1
  n += 1 until n.odd? && n % 7 == 0 
  
  loop do 
    return n if n.to_s.chars == n.to_s.chars.uniq 
    n += 14
  end
end

# bubble sort 

def bubble_sort!(array)
  new_array = []
  loop do
    new_array = swap_round(array)
    break if new_array == swap_round(new_array)
  end
  new_array 
end

def swap_round(array)
  0.upto(array.size - 2) do |i|
    next unless array[i] > array[i + 1]
      array[i], array[i + 1] = array[i + 1], array[i]
  end
  array 
end

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if array[index - 1] <= array[index]
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

# sum_square_difference

def sum_square_difference(number)
  sum_square = (1..number).reduce(:+)**2
  square_sum = (1..number).reduce { |memo, i| memo += i**2 }
  sum_square - square_sum
end

#madlibs revisted 



text = File.read('hello.txt')

ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('hello.txt') do |file|
  file.each do |line|
     format( line, noun: NOUNS.sample,
                       verb:  VERBS.sample,
                       adjective: ADJECTIVES.sample,
                       adverb: ADVERBS.sample)
   end
 end
 
# seeing stars


def star(number)
  middle_line = "*" * number
  
  bottom_half = []
  (number/2).times do |i|
    bottom_half << "***".gsub('*', '*' + ' ' * i).strip.center(number)
  end
  bottom_half.reverse << middle_line << bottom_half
end

#transpose

def transpose(matrix)
  transposed_array = Array.new(matrix[0].size){Array.new(matrix.size)} 
  matrix.each_with_index do |row, row_number|
    row.each_with_index do |item, column_number|
      transposed_array[column_number][row_number] = item
    end
  end
  transposed_array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]



new_matrix = transpose(matrix)

# rotate 90

def rotate90(matrix)
  transpose(matrix).map { |row| row.reverse }
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

# permutations 

def permutations(array)
  perm = []
  (array.size).times do |index1|
    (array.size).times do |index2|
      array_copy = array.clone
      array_copy[index1], array_copy[index2] = array_copy[index2], array_copy[index1]
      perm << array_copy
    end
  end
  perm.uniq
end

def permutations(array)
  return [array] if array.size == 1

  result = []
  array.each_with_index do |element, index|
    sub_array = array[0...index] + array[(index + 1)..-1]
    sub_permutations = permutations(sub_array)
    sub_permutations.each do |permutation|
      result << [element] + permutation
    end
  end

  result
end


# fix the bug

def my_method(array)
  if array.empty?
    []
  elsif array.size == 1
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end
  end
end

# merge

def merge(array1, array2)
  merged_array = []
  loop do 
    if array1.empty? || array2.empty?
      array1.empty? ? merged_array << array2 : merged_array << array1
      break
    else
      array1.first < array2.first ? merged_array << array1.shift : merged_array << array2.shift
    end
    break if array1.empty? && array2.empty?
  end
  merged_array.flatten
end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

#egyptian fractions 

def egyptian(rational)
  denominator_array = []
  sum = 0
  denom = 1
  until sum >= rational do 
    if (sum + Rational(1, denom)) <= rational
      sum += Rational(1, denom)
      denominator_array << denom 
    end
    denom += 1
  end
  denominator_array
end

def unegyptian(array)
  array[1..-1].inject(Rational(1, array.first)) do |rational_sum, number|
    rational_sum += Rational(1, number)
  end
end
    
# p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)

# ASCII String Value

def ascii_value(string)
  string.chars.reduce(0) do |memo, character|
    memo += character.ord
  end
end

# After Midnight (Part 1)

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes % MINUTES_PER_DAY
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  delta_minutes.divmod(MINUTES_PER_HOUR)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

# After Midnight (Part 2)

def after_midnight(time_string)
  hours, minutes = time_string.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_string)
  return 0 if time_string == '24:00' || time_string == '00:00'
  MINUTES_PER_DAY - after_midnight(time_string)
end

# Letter Swap

def swap(string)
  string.split.map do |word| 
    word[0], word[-1] = word[-1], word[0] 
    word 
  end.join(' ')
end

# Clean up the words

def cleanup(string)
  string.gsub(/\W/, ' ').gsub(/\s+/, ' ')
end

# Letter Counter (Part 1)

def word_sizes(string)
  hash = string.split.group_by do |word| 
    word.length
  end
  hash.map do |k, v|
    hash[k] = v.size
  end
  hash 
end
  
# Alphabetical Numbers

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)


# ddaaiillyy ddoouubbllee

def crunch(string)
  string.split.map do |word|
    finished_word =[]
    word.chars.each_with_index do |letter, index|
      next if word[index - 1] == letter
      finished_word << letter
    end
    finished_word.join('')
  end.join(' ')
end

# Bannerizer

def print_in_box(string)
  p '+--+'.insert(2, '-' * string.length)
  p '|  |'.insert(2, ' ' * string.length)
  p '|  |'.insert(2, string)
  p '|  |'.insert(2, ' ' * string.length)
  p '+--+'.insert(2, '-' * string.length)
end


# cute angles

MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60

def dms(float)
  degrees = float.to_i 
  remainder = float - float.to_i 
  minutes = (remainder * MINUTES_IN_DEGREE)
  seconds_remainder = minutes - minutes.to_i 
  seconds = seconds_remainder * SECONDS_IN_MINUTE
  
  %(#{degrees}°#{minutes.to_i}'#{seconds.to_i}")
  format('%d°%02d\'%02d"', degrees, minutes.to_i, seconds.to_i)
end 

#delete vowels 

VOWELS = 'aeiouAEIOU'

def remove_vowels(array)
  array.map do |string|
    string.delete(VOWELS)
  end
end

#Fibonacci Number Location By Length

def find_fibonacci_index_by_length(digits)
  place_counter = 2
  first, last = [1, 1]
  loop do
    place_counter += 1
    first, last = last, first + last 
    break if last.to_s.length == digits 
  end
  place_counter
end

# Reversed Arrays (Part 1)

def reverse!(array)
  ((array.size)/2).times  do 
    array.unshift(array.pop)
  end
  array 
end

def reverse(array)
  array.inject([]) { |memo, number| memo.unshift(number) }
end

# Combining Arrays

def merge(array1, array2)
  (array1 << array2).flatten.uniq 
end

# halvsies

def halvsies(array)
  half_size_take = (array.size/2.to_f).ceil 
  half_size_drop = (array.size/2)
  new_array = []
  new_array << array.take(half_size_take)
  new_array << array.drop(half_size_drop)
  
end

