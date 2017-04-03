class AddStatsToPokemon < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :attack, :integer, null: false
    add_column :pokemons, :defense, :integer, null: false
    add_column :pokemons, :hp, :integer, null: false
    add_column :pokemons, :special_attack, :integer, null: false
    add_column :pokemons, :special_defense, :integer, null: false
    add_column :pokemons, :speed, :integer, null: false
  end
end
