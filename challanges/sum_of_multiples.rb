class SumOfMultiples
  def initialize(*args)
    @multiples = args
  end
  
  def to(number)
    range = (1...number)
    multiples_array = [0]
    @multiples.each do |mult|
      range.each do |i|
        multiples_array << i if i % mult == 0 
      end
    end
    
    multiples_array.uniq.reduce(:+)
  end
  
  def self.to(number)
    new_obj = SumOfMultiples.new(3, 5)
    new_obj.to(number)
  end

  
end
