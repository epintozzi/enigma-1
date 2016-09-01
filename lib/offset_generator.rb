require 'pry'
require 'date'
require './lib/key_generator'

class OffsetGenerator

  attr_accessor :key, :first_offset, :second_offset, :third_offset, :fourth_offset

  def initialize(key, date=Date.today)
    @key = key
    @date = date
  end

  def date_generator
    date_string = @date.strftime('%m%d%y')
    @date_squared = (date_string.to_i**2).to_s
    return @date_squared
  end

  def offset(range, slice_at)
    @key.slice(range).to_i + date_generator.slice(slice_at).to_i
  end

  def first_offset
    offset(0..1, -4)
  end

  def second_offset
    offset(1..2, -3)
  end

  def third_offset
    offset(2..3, -2)
  end

  def fourth_offset
    offset(3..4, -1)
  end

end
