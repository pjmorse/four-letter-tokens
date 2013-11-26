Four Letter Tokens
==================

A Ruby solution for https://gist.github.com/seanthehead/7220609 .

To run, after cloning this repository, run `./find_tokens.rb` and supply the name of a dictionary file. `dictionary.txt` is included in the repository, so `./find_tokens.rb ./dictionary.txt` from the project directory will run on that file.

The command will return a message reporting how many unique four-letter sequences were found in that file.

Self-checking
--------

The `FourLetterTokens::Word` class will self-test in IRB; run `FourLetterTokens::Word.test` to validate that the class is reporting the tokens from different words properly. The `FourLetterTokens::Checker` class does not have this feature.