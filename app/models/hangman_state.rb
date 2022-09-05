class HangmanState < ApplicationRecord
  has_many :guesses

  LIVES = 9

  def random_word
    begin
    words = IO.readlines("words.txt")
    words.sample
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
    hidden = random_word_array.map{ |x| !guesses.include?(x) ? '*' : x }
    hidden.join('')
  end



end
