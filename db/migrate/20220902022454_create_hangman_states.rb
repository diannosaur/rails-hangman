class CreateHangmanStates < ActiveRecord::Migration[6.1]
  def change
    create_table :hangman_states do |t|
      t.string :word

      t.timestamps
    end
  end
end
