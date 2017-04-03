class CreatePokemonMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_moves do |t|
      t.belongs_to :pokemon, null: false, foreign_key: true
      t.belongs_to :move, null: false, foreign_key: true
      t.integer :level, null: false
      t.timestamps
    end

    add_index :pokemon_moves, [:pokemon_id, :move_id], unique: true
  end
end
