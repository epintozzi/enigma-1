require 'pry'
require './lib/offset_generator'
require './lib/key_generator'

class Enigma

  attr_accessor :offset, :key

  def initialize
    @key = Key.new
  end

  def char_map
    @alphabet = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
                   a b c d e f g h i j k l m n o p q r s t u v w x y z
                   . ! @ # $ % ^ & * ( ) [ ] , < > ; : / ? \ |)
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

  def cracker(message)
    crack_this = message.reverse.chars

    @crack_offset_1 = @alphabet.index(".") - @alphabet.index(crack_this[0])
    @crack_offset_2 = @alphabet.index(".") - @alphabet.index(crack_this[1])
    @crack_offset_3 = @alphabet.index("d") - @alphabet.index(crack_this[2])
    @crack_offset_4 = @alphabet.index("n") - @alphabet.index(crack_this[3])

    @cracked_message = []

    crack_this.each_with_index do |char, index|
      if index % 4 == 0
        offset = @crack_offset_1
      elsif index % 4 == 1
        offset = @crack_offset_2
      elsif index % 4 == 2
        offset = @crack_offset_3
      elsif index % 4 == 3
        offset = @crack_offset_4
      end

      if char_map.include?(char)
        @rotated_character = @alphabet.rotate(@alphabet.index(char) + offset).first
        @cracked_message << @rotated_character
        # binding.pry
      else
        @cracked_message << char
      end
    end
    return @cracked_message.reverse.join
  end



  private
  # def does_something(index, offset_1, alphabet, char)
  #   if index % 4 == 0
  #     offset = offset_1.first_offset
  #   elsif index % 4 == 1
  #     offset = offset_1.second_offset
  #   elsif index % 4 == 2
  #     offset = offset_1.third_offset
  #   elsif index % 4 == 3
  #     offset = offset_1.fourth_offset
  #   end
  #
  #   if char_map.include?(char)
  #     @rotated_character = alphabet.rotate(alphabet.index(char) + offset).first
  #     @encrypted_message << @rotated_character
  #   else
  #     @encrypted_message << char
  #   end
  # end


end

e = Enigma.new
message = "Won't you please be so kind and encrypt this very secret message?..end.."
output = e.encrypt(message)
puts output
# puts e.decrypt(output, "12345")
puts e.cracker(output)
