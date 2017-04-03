class CreateMoveMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :move_methods do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.timestamps
    end

    add_index :move_methods, :name, unique: true
  end
end
