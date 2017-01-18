class OddWords 
  def initialize(sentence)
    #convert sentece into array of words
    #while removing period and any spaces prior to it
    @words = sentence.gsub(/\s*\./, '').split
  end
  
  def reverse_odds
    @words.map.with_index do |word, i| 
      i.odd? ? word.reverse : word
    end.join(' ') + '.'
  end
end