class PhoneNumber
  DEFAULT_NUM = '0000000000'
  
  attr_reader :number 
  
  def initialize(num_string)
    @number = set_up(num_string)
  end
  
  def set_up(num_string)
    just_numbers = num_string.gsub(/[ ()-\.]/, '')
    
    just_numbers = just_numbers[1..-1] if eleven_digit_working?(just_numbers)
    return DEFAULT_NUM if just_numbers.match(/\D/)
    return DEFAULT_NUM unless just_numbers.size == 10
    
    just_numbers
  end
  
  def eleven_digit_working?(number)
     number.size == 11 && number[0] == '1'
  end
  
  def area_code
    number.slice(0, 3)
  end
  
  def to_s
    "(#{area_code}) #{number.slice(3,3)}-#{number.slice(6, 4)}"
  end
end

p PhoneNumber.new('12a3a4a5a6a7a8a9a0a').number