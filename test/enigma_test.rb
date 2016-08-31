require_relative 'test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_can_decrypt_message
    d = Enigma.new

    assert d.decrypt("hello", "12345", date=Date.today)
  end

  def  test_it_decrypts_correct_number_of_characters
    d = Enigma.new
    message = d.decrypt("hello", "12345", date=Date.today)

    assert_equal 5, message.length

    message = d.decrypt("turing", "12345", date=Date.today)

    assert_equal 6, message.length
  end

  def test_it_can_encrypt
    e = Enigma.new
    message = e.encrypt("hello", "12345", date=Date.today)

    assert_equal "@%DP(", message
  end

  def  test_it_encrypts_correct_number_of_characters
    d = Enigma.new
    message = d.encrypt("hello", "12345", date=Date.today)

    assert_equal 5, message.length

    message = d.encrypt("turing", "12345", date=Date.today)

    assert_equal 6, message.length
  end

  def test_it_can_encrypt_message
    d = Enigma.new

    assert d.encrypt("hello", "12345", date=Date.today)
  end

  def test_it_can_crack_message
    d = Enigma.new
    message = "Hello..end.."
    output = d.encrypt(message)
    assert "Hello..end..", d.cracker(output)
  end

end
