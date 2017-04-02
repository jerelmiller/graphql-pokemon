class CreatePokemonWeaknesses < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_weaknesses do |t|
      t.belongs_to :pokemon, foreign_key: true
      t.belongs_to :type, foreign_key: true
      t.timestamps
    end

    add_index :pokemon_weaknesses, [:pokemon_id, :type_id], unique: true
  end
end
