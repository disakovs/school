class Scrabble  
  SCRABBLE_SCORING = { 
['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
['D', 'G'] =>                                         2,
['B', 'C', 'M', 'P'] =>                               3,
['F', 'H', 'V', 'W', 'Y' ] =>                         4,
['K'] =>                                              5,
['J', 'X']  =>                                        8,
['Q', 'Z'] =>                                        10
}.freeze
  
  def initialize(word)
    @word_array = set_up(word)
  end
  
  def score
    sum = 0
    @word_array.each do |letter|
      SCRABBLE_SCORING.each do |k, v| 
        sum += v if k.include? letter
      end
    end
    sum
  end
  
  def self.score(word)
    Scrabble.new(word).score 
  end
  
  private
  
  def set_up(word)
    word = '' if word.nil?
    word.upcase.chars
  end
end

p 
p Scrabble.new('doggd').score