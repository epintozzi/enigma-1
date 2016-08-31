require 'pry'
require './lib/offset_generator'
require './lib/key_generator'

class Enigma

  attr_accessor :offset, :key

  def initialize
    @key = Key.new
  end

  def char_map
    @alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  end

  def encrypt(message, key = nil, date = Date.today, alphabet = char_map)

    characters = message.chars
    @our_key = key || @key.key_generator
    # binding.pry
    @offset = OffsetGenerator.new(@our_key, date)
    @encrypted_message = []

    characters.each_with_index do |char, index|
      if index % 4 == 0
        offset = @offset.first_offset
      elsif index % 4 == 1
        offset = @offset.second_offset
      elsif index % 4 == 2
        offset = @offset.third_offset
      elsif index % 4 == 3
        offset = @offset.fourth_offset
      end

      if char_map.include?(char)
        @rotated_character = alphabet.rotate(alphabet.index(char) + offset).first
        @encrypted_message << @rotated_character
      else
        @encrypted_message << char
      end
    end
    return @encrypted_message.join
  end

  def decrypt(message, key, date = Date.today)
    self.encrypt(message, key, date, char_map.reverse)
  end

end

  e = Enigma.new
  message = "hello..end.."
  output = e.encrypt(message, "12345")
  puts output
  puts e.decrypt(output, "12345")
