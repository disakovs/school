module Atbash
  ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

  def self.encode(sentence)
    word = convert(sentence)
    encoded = encode_one(word)
    space_every_four(encoded)
  end

  def self.encode_one(word)
    word.chars.map do |letter|
      if ALPHABET.include? letter
        index = ALPHABET.index(letter)
        ALPHABET[25 - index]
      else
        letter
      end
    end.join
  end

  def self.convert(sentence)
    sentence.gsub(/\W/, '').downcase
  end

  def self.space_every_four(string)
    string.scan(/.{1,5}/).join(' ')
  end
end
