def divisors(num)
  return [1] if num == 1 
  divisor_array = [1, num]
  counter = 2
  
  while counter < divisor_array.last 
    factor, remainder = num.divmod(counter)
    divisor_array.concat([counter, factor]) if remainder == 0
    counter += 1
  end
  
  divisor_array.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] 
p divisors(999962000357)