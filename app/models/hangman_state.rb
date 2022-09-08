class HangmanState < ApplicationRecord
  has_many :guesses

  accepts_nested_attributes_for :guesses

  LIVES = 9

  def random_word
    begin
    words = IO.readlines("public/words.txt")
    words.sample.chomp
    rescue => e
      e.message
    end
  end

  def random_word_array
    word.split('')
  end

  def player_alive? # question mark method treated like a boolean, shouldn't ever change any state.
    number_of_errors < LIVES
  end

  def word_found?
    # we know the word is found if all the letters in the word exist in the guesses array
    random_word_array.all? { |x| guesses.include?(x) }
  end

  def game_in_progress?
    player_alive? && !word_found?
  end

  def number_of_errors
    # guesses that are not in the word
    guesses.count { |x| !random_word_array.include?(x)} #ruby array.count method
  end

  def hidden_word
    hidden = random_word_array.map{ |x| !guesses.any?{|guess| guess.guess == x} ? '*' : x }
    hidden.join('')
  end
# guesses is not an array of strings, its an array of guess objects



end
