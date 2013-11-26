module FourLetterTokens
  class Word
    def initialize(word_string)
      @wordstring = word_string
    end

    # Return an array of tokens found in the word
    def get_tokens
      tokens = []
      start = 0
      # Presumption: if the word is not at least 4 letters long, it contains no 4-letter sequences.
      (@wordstring.length - 3).times do
        tokens << @wordstring[start,4]
        start = start + 1
      end
      return tokens
    end

    def self.test
      # Given a known word, does this return the expected sequences?
      four_word   = (self.new('four').get_tokens == ['four'])
      six_word    = (self.new('string').get_tokens == ['stri', 'trin', 'ring'])
      three_word  = (self.new('new').get_tokens == [])
      return (four_word && six_word && three_word)
    end
  end
end