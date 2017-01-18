module PigLatin
    
  def self.translate(phrase)
     phrase.split.map(&method(:translate_one)).join(" ")
  end
    
  def self.translate_one(word)
    start_of_word = word[/^[^aeiou]*/]
    if word.match(/^[aeoui]|^[xy][^aeiou]/)
      word
    elsif start_of_word.include? "q"
      (word + start_of_word + "u")[start_of_word.length + 1..-1]
    else
      (word + start_of_word)[start_of_word.length..-1]
    end + "ay"
  end
    
end