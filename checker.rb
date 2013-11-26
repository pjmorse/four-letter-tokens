module FourLetterTokens
  class Checker
    require './word.rb'

    # Gets a dictionary file as input
    def initialize(filename)
      @infile = filename
      @seq_count = 0
      @found_sequences = {}
      # N.B. the actual work gets done here where `check_file` is called.
      puts "#{check_file} sequences found."
      write_results
    end

    # Checks the provided word list for unique sequences, populating the list and returning a count.
    def check_file
      # Read dictionary
      @word_list = File.open(@infile)
      @word_list.each do |word|
        w = Word.new(word.chop)
        # Check each token from word
        w.get_tokens.each do |seq|
          if check_sequence(seq) # Returns true if unique so far
            # Add to sequences array
            @found_sequences[seq] = word.chop
            @seq_count = @seq_count + 1
          end
        end
      end
      return @seq_count
    end

    # Check sequences against previously found sequences
    def check_sequence(test_seq)
      return !@found_sequences.has_key?(test_seq)
    end

    # Output @found_sequences array to files
    def write_results
      # Open files for writing
      sequences_file = File.open('sequences', 'w')
      words_file = File.open('words', 'w')
      @found_sequences.each_pair do |sequence, word|
        sequences_file.write "#{sequence}\n"
        words_file.write "#{word}\n"
      end
      sequences_file.close
      words_file.close
    end
  end
end