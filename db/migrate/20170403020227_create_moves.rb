class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.belongs_to :type, null: false, foreign_key: true
      t.belongs_to :effect, null: false, foreign_key: true

      t.string :name, null: false

      t.integer :power
      t.integer :pp, null: false
      t.integer :accuracy
      t.integer :effect_chance
    end
  end
end
