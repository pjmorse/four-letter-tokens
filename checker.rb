class Checker
  require './word.rb'
  require './sequence.rb'

  # Gets a dictionary file as input
  def initialize(filename)
    @infile = filename
    @seq_count = 0
    @found_sequences = []
    puts "#{check_file} sequences found."
    write_results
  end

  # Verify that there is a sequence file open for checking, with the file
  # read at the beginning
  def sequence_file_check
    @sequences = @sequences || File.open('sequences', 'r')
    @sequences.rewind
  end

  # Open dictionary
  def open_word_list
    @word_list = File.open(@infile)
  end

  # Open sequences file for writing
  def open_sequence_file
    @sequences = File.open('sequences', 'w')
  end

  # Open words file
  def open_words_file
    @words = File.open('words', 'w')
  end

  # Checks the provided word list for unique sequences, populating the list and returning a count.
  def check_file
    open_word_list

    # Read dictionary
    @word_list.each do |word|
      w = Word.new(word.chop)
      w.get_tokens.each do |seq|
        if check_sequence(seq)
          # If not found, add to sequences array
          @seq_count = @seq_count + 1
          @found_sequences << Sequence.new(seq, word.chop)
        end
      end
    end
    return @seq_count
  end

  def check_sequence(test_seq)
    # For each word, check sequences against sequences file
    unique = true
    @found_sequences.each do |known_seq|
      if known_seq.get_token == test_seq
        unique = false
        break
      end
    end
    return unique
  end

  # Output @found_sequences array to files
  def write_results
    unless @found_sequences.empty?
      open_sequence_file
      open_words_file
      @found_sequences.each do |seq|
        @sequences.write "#{seq.get_token}\n"
        @words.write "#{seq.get_word}\n"
      end
      @sequences.close
      @words.close
    end
  end
end
