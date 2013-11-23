class Checker
  require './word.rb'

  # Gets a dictionary file as input
  def initialize(filename)
    @infile = filename
    @seq_count = 0
    check_file
  end

  def sequence_file_check
    @sequences = @sequences || File.open('sequences', 'r')
    @sequences.rewind
  end

  def check_file
    # Open dictionary
    word_list = File.open(@infile)

    # Open sequences file for writing
    sequences = File.open('sequences', 'w')

    # Open words file
    words = File.open('words', 'w')

    # Read dictionary
    word_list.each do |word|
      w = Word.new(word.chop)
      w.get_tokens.each do |seq|
        if check_sequence(seq)
          # If not found, write to sequences file
          # And write word to words file
          @seq_count = @seq_count + 1
          sequences.write("#{seq}\n")
          words.write("#{word}\n")
        end
      end
    end
    return @seq_count
  end

  def check_sequence(test_seq)
    # For each word, check sequences against sequences file
    unique = true
    sequence_file_check
    @sequences.each do |known_seq|
      if known_seq == test_seq
        unique = false
        break
      end
    end
    return unique
  end
end
