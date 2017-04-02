class CreatePokemonStrengths < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemon_strengths do |t|
      t.belongs_to :pokemon, foreign_key: true
      t.belongs_to :type, foreign_key: true
      t.timestamps
    end

    add_index :pokemon_strengths, [:pokemon_id, :type_id], unique: true
  end
end
