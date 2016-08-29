gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_it_encrypts_message
    e = Encryptor.new

    refute_equal "hello", e.encrypt("hello")
  end

  def test_it_encrypts_correct_number_of_characters
    e = Encryptor.new
    message = e.encrypt("hello")

    assert_equal 5, message.length
  end



end
