class Series 
  def initialize(num_string)
    # convert string into array of single digits
    @digit_array = num_string.chars.map(&:to_i)
  end
  
  def slices(number)
    raise ArgumentError if number > @digit_array.size
    
    @digit_array.each_cons(number).to_a
  end
end