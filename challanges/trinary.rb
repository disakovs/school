class DecimalConversion 
  TYPE = 10
  
  def initialize(string_num)
     @reverse_digits = process(string_num)
  end
  
  def to_decimal
    sum = 0 
    @reverse_digits.each_with_index do |i, index|
      sum += i*(self.class::TYPE)**index
    end
    
    sum 
  end
  
  def process(string_number)
    if string_number.match(/[^0-#{self.class::TYPE - 1}]/)
      [0]
    else
      string_number.chars.map(&:to_i).reverse
    end
  end
end

class Trinary < DecimalConversion
  TYPE = 3
end

