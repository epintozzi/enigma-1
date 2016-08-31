require'pry'

class Key

	attr_accessor :key

  def key_generator
    @key = (0..9).to_a.shuffle
    @key = @key[0..4].join
  end

end
