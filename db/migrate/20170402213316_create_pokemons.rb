class CreatePokemons < ActiveRecord::Migration[5.0]
  def change
    create_table :pokemons do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.text :description
    end
  end
end
