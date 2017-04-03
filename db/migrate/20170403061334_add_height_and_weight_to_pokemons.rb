class AddHeightAndWeightToPokemons < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :height, :float, precision: 2
    add_column :pokemons, :weight, :float, precision: 2
  end
end
