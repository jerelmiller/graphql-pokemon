class AddInvolutionIdToPokemon < ActiveRecord::Migration[5.0]
  def change
    add_column :pokemons, :involution_id, :integer
  end
end
