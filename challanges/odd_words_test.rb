require 'minitest/autorun'
require_relative 'odd_words'

class OddWordsTest < Minitest::Test
  def test_one_word
    sentence = OddWords.new("hi.").reverse_odds
    assert_equal("hi.", sentence)
  end
  
  def test_two_words
    sentence = OddWords.new("hi jim.").reverse_odds
    assert_equal("hi mij.", sentence)
  end
  
  def test_3_word_sentence
    sentence = OddWords.new("hi jim bye.").reverse_odds
    assert_equal("hi mij bye.", sentence)
  end
  
  def test_4_word_sentence_with_period
    sentence = OddWords.new("hi jim bye bill.").reverse_odds
    assert_equal("hi mij bye llib.", sentence)
  end
  
  def test_4_word_sentence_with_period
    sentence = OddWords.new("hi     jim bye bill      .").reverse_odds
    assert_equal("hi mij bye llib.", sentence)
  end
end