class Sieve 
  def initialize(num)
    @range = (2..num)
  end
  
  def primes 
    primes = []
    left_over = @range.to_a
    
    until left_over.empty?
      primes << left_over.first
      left_over = process_numbers(left_over)
    end
    
    primes
  end
  
  private
  
  def process_numbers(array)
    array.reject { |num| num % array.first == 0 }
  end
end
