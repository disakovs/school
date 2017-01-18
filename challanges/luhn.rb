class Luhn 
  def initialize(num)
    @number = reverse_num_array(num)
  end
  
  def reverse_num_array(number)
    number.to_s.reverse.chars.map(&:to_i)
  end
  
  def addends
    @number.map.with_index do |digit, index|
      if index.odd?
        if digit * 2 > 9
          digit * 2 - 9
        else
          digit * 2
        end
      else
        digit
      end
    end.reverse 
  end
  
  def checksum
    addends.reduce(:+)
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(num)
    test_number = Luhn.new(num*10).checksum 
    return num * 10 if test_number % 10 == 0
    missing_amount = (10 - test_number % 10)
    num*10 + missing_amount
  end
end
      