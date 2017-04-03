class AddMoveMethodToPokemonMoves < ActiveRecord::Migration[5.0]
  def change
    add_reference :pokemon_moves, :move_method, index: true, null: false, foreign_key: true
    remove_index :pokemon_moves, [:pokemon_id, :move_id]
    add_index :pokemon_moves,
      [:pokemon_id, :move_id, :move_method_id],
      unique: true,
      name: 'index_pokemon_move_pokemon_move'
  end
end
