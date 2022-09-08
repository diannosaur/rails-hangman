class Guess < ApplicationRecord

  belongs_to :hangman_state

  validates :guess, presence: true, length: {maximum: 1 }, format: { with: /\A[a-z]+\z/, message: "only allows lowercase letters" }, uniqueness: { scope: :hangman_state_id, message: "already guessed" }


  # def guesses_per_game(game_id)
  #   Guess.where(["hangman_state_id = ?", game_id)
  # end

end

# class GoodnessValidator < ActiveModel::Validator
#   def validate(record)
#     if record.first_name == "Evil"
#       record.errors.add :base, "This person is evil"
#     end
#   end
# end
