module PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    
    return 'deficient' if deficient?(number)
    return 'perfect' if perfect?(number)
    return 'abundant' if abundant?(number)
  end
  
  def self.deficient?(number)
    sum_of_factors(number) < number
  end
  
  def self.perfect?(number)
    sum_of_factors(number) == number
  end
  
  def self.abundant?(number)
    sum_of_factors(number) > number
  end
  
  def self.sum_of_factors(number)
    (1..number/2).select { |i| number % i == 0 }.reduce(:+)
  end
end

p  PerfectNumber.classify(28)