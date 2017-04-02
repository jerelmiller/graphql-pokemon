class CreateTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :types do |t|
      t.string :name, null: false
    end

    add_index :types, :name, unique: true
  end
end
