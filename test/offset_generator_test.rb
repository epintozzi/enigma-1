require_relative 'test_helper'
require './lib/offset_generator'

class OffsetGeneratorTest < Minitest::Test

  def test_can_generate_date
    offset = OffsetGenerator.new("12345", date = Date.today)

    assert offset.date_generator
  end

  def test_it_calculates_the_first_offset
    offset = OffsetGenerator.new("12345", date = Date.today)

    assert_equal 21, offset.first_offset
  end

  def test_it_calculates_the_second_offset
    offset = OffsetGenerator.new("12345", date = Date.today)

    assert_equal 27, offset.second_offset
  end

  def test_it_calculates_the_third_offset
    offset = OffsetGenerator.new("12345", date = Date.today)

    assert_equal 39, offset.third_offset
  end

  def test_it_calculates_the_fourth_offset
    offset = OffsetGenerator.new("12345", date = Date.today)

    assert_equal 51, offset.fourth_offset
  end


# #figure out how to pass in key
#   def test_it_can_calculate_with_random_key
#     offset = OffsetGenerator.new(@key.key_generator, date = Date.today)
#
#     assert offset.first_offset
#   end

end
