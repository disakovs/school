require 'securerandom'

SECTIONS = [0..7, 8..11, 12..15, 16..19, 20..31]

def generate_UUID 
  hex_string = SecureRandom.hex
  SECTIONS.each_with_object("") do | range, string_with_dash |
    string_with_dash << hex_string[range] + '-'
  end.chomp('-')
    
end

p generate_UUID