class CreateHangmanStates < ActiveRecord::Migration[6.1]
  def change
    create_table :hangman_states do |t|
      t.string :guesses
      t.integer :lives
      t.string :word
      t.boolean :game_in_progress
      t.boolean :word_found
      t.string :hidden_word
      t.string :games

      t.timestamps
    end
  end
end
