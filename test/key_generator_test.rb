require_relative 'test_helper'
require './lib/key_generator'

class KeyTest < Minitest::Test
  def test_can_generate_random_key
    key = Key.new
    key.key_generator

    assert_equal 5, key.key.length
  end

  def test_key_is_five_digits
    key = Key.new

    assert_equal 5, key.key_generator.length
  end

end
