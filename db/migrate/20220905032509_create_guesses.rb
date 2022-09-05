class CreateGuesses < ActiveRecord::Migration[6.1]
  def change
    create_table :guesses do |t|
      t.string :guess
      t.references :hangman_state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
