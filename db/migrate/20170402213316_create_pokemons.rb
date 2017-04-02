class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.text :description
    end

    add_index :pokemons, :number, unique: true
    add_index :pokemons, :name, unique: true
  end
end
