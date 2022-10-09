class HangmanState < ApplicationRecord
  has_many :guesses, :dependent => :delete_all

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
    guesses.map(&:guess) # ruby method
    # guesses.pluck(:guess) = ActiveRecord method, a bit faster. Only works when you're getting values from columns
  end

  def lost?
    LIVES <= number_of_errors
  end

  def won?
    random_word_array.all? { |x| guesses_made.include?(x) }
  end

  def finished?
    won? || lost?
  end

  def lives_left
    LIVES - number_of_errors
  end

  def number_of_errors
    # guesses that are not in the word
    guesses_made.count { |x| !random_word_array.include?(x)} #ruby array.count method
  end

  def hidden_word
    random_word_array.map{ |x| !guesses.any?{|guess| guess.guess == x} ? nil : x }
    # hidden.join('')
  end

end
