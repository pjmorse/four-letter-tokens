class Sequence
  def initialize(sequence, source)
    @token    = sequence
    @word     = source
  end

  def get_token
    @token
  end

  def get_word
    @word
  end
end