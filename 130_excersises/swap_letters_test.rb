require 'minitest/autorun'

require_relative 'swap_letters'

class TextTest < Minitest::Test 
  def setup
    @text = Text.new('arab')
    @text2 = Text.new('arab dude done')
    @file = File.open('./sample_text.txt', 'r')
    @text3 = Text.new(@file.read)
  end
  
  def test_swap_a_e
    assert_equal 'ereb', @text.swap('a', 'e')
  end
  
  def test_word_count
    assert_equal 1, @text.word_count
    assert_equal 3, @text2.word_count
    assert_equal 72, @text3.word_count
  end
    
  def teardown
    @text
    @text2
    @file.close 
    puts "File has been closed: #{@file.closed?}"
  end
end

