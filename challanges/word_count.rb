class Phrase
  def initialize(sentence)
    @words = sentence.scan(/\b[\w']+\b/).map(&:downcase)
  end
  
  def word_count
    hash = @words.group_by {|word| word }
    hash.each { |k, v| hash[k] = v.size }
  end
end

p Phrase.new('one fish two fish red fish blue fish').word_count