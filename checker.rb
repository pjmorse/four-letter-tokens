class Checker
  # Gets a dictionary file as input
  def initialize(filename)
    @infile = filename
    check_file
  end

  def check_file
    # Open dictionary
    word_list = File.open(@infile)

    # Open sequences file for writing
    sequences = File.open('sequences', 'w')

    # Open sequences file for checking
    # Same file, different filehandle
    sequence_check = File.open('sequences', 'r')

    # Open words file
    words = File.open('words', 'w')

    # Read dictionary
    word_list.each do |word|
      w = Word.new(word)
      w.get_tokens.each do |seq|
        # For each word, check sequences against sequences file
        sequence_check.rewind
        unique = false
        sequence_check.each do |known_seq|
          if known_seq == seq
            break
          end
          unique = true
        end
        if unique
          # If not found, write to sequences file
          # And write word to words file
          sequences.write("#{seq}\n")
          words.write("#{word}\n")
        end
      end
    end
  end
end
