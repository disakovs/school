

def reduce(array, sum = 0)
  index = 0
  acc = sum 
  
  while index < array.size
  p yield(acc, array[index])
    acc = yield(acc, array[index])
    index += 1
  end
  
  p acc
end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? } 