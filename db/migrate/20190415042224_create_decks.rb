class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.boolean :shuffled
      t.integer :cards_count, default: 0

      t.timestamps
    end
  end
end
