class AddOrderToPokemonTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemon_types, :order, :integer, null: false
  end
end
