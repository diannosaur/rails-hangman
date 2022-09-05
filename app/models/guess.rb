class Guess < ApplicationRecord
  belongs_to :hangman_state

  def store_guess(guess) # Moved here from controller: "red flag because you're modifying another class' instance variable, makes it more exposed and hard to manage. Better to expose the methods that modify them. Protect from other classes as much as possible."
    guesses << guess
  end


end
