class CreatePokemonsWeaknesses < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons_weaknesses do |t|
      t.belongs_to :pokemons, index: true
      t.belongs_to :types, index: true
      t.timestamps
    end
  end
end
