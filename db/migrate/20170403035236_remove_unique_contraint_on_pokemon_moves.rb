class RemoveUniqueContraintOnPokemonMoves < ActiveRecord::Migration[5.0]
  def change
    remove_index :pokemon_moves, name: 'index_pokemon_move_pokemon_move'
  end
end
