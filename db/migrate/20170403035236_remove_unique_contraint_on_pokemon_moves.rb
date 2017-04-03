class RemoveUniqueContraintOnPokemonMoves < ActiveRecord::Migration[5.0]
  def up
    remove_index :pokemon_moves, name: 'index_pokemon_move_pokemon_move'
  end

  def down
    add_index :pokemon_moves,
      [:pokemon_id, :move_id, :move_method_id],
      unique: true,
      name: 'index_pokemon_move_pokemon_move'
  end
end
