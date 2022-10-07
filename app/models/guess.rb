class Guess < ApplicationRecord

  belongs_to :hangman_state

  validates :guess, presence: true, length: {maximum: 1 }, format: { with: /\A[a-z]+\z/, message: "only allows lowercase letters" }, uniqueness: { scope: :hangman_state_id, message: "already guessed" }

end


