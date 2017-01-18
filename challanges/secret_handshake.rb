class SecretHandshake
  HANDSHAKE_RULES = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse']
  
  def initialize(number)
    @number = number.to_i.to_s(2) 
  end
  
  def commands
    num = @number.reverse
    handshake = []
    HANDSHAKE_RULES.each_with_index do |rule, i|
      handshake << rule if num[i] == '1'
    end
    handshake.include?('reverse') ? reverse(handshake) : handshake
  end
  
  def reverse(handshake)
    handshake.pop
    handshake.reverse
  end
end

p SecretHandshake.new(2).commands 