class Octal 
  def initialize(string_num)
     process(string_num)
  end
  
  def to_decimal
    sum = 0 
    @reverse_digits.each_with_index do |i, index|
      sum += i*8**index
    end
    
    sum 
  end
  
  private
  
  def process(string_number)
    if string_number.match(/[^0-7]/)
      @reverse_digits = [0]
    else
      @reverse_digits = string_number.chars.map(&:to_i).reverse
    end
  end
end