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

  def guesses_made
    guesses.map(&:guess)
  end

  # def game_won?
  #   guesslist = []
  #   guesses.to_a.map { |guess| guesslist.push(guess.guess)}
  #   random_word_array.all? { |x| guesslist.include?(x)}
  # end

  def lost? # question mark method treated like a boolean, shouldn't ever change any state.
    LIVES <= number_of_errors
  end

  def won?
    # we know the word is found if all the letters in the word exist in the guesses array
    random_word_array.all? { |x| guesses_made.include?(x) }
  end

  # def end_win
  #   random_word_array.all? { |x| guesses_made.include?(x) }
  # end

  # def end_lose
  # end

  # def game_over
  #   !player_alive? && won?
  # end

  def lives_left
    LIVES - number_of_errors
  end

  def number_of_errors
    # guesses that are not in the word
    guesses_made.count { |x| !random_word_array.include?(x)} #ruby array.count method
  end

  def hidden_word
    hidden = random_word_array.map{ |x| !guesses.any?{|guess| guess.guess == x} ? '*' : x }
    hidden.join('')
  end
# guesses is not an array of strings, its an array of guess objects



end
