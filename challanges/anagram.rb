class Anagram
  def initialize(word)
    @word = word
    @word_letters = word.downcase.chars.sort
  end
  
  def anagram_of?(string)
    @word_letters == string.downcase.chars.sort
  end
  
  def match(words)
    selected = words.select { |one_word| anagram_of? one_word }
    selected.delete_if { |one_word| @word.downcase == one_word.downcase}
  end
end
