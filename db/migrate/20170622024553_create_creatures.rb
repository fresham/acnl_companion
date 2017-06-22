class CreateCreatures < ActiveRecord::Migration[5.1]
  def change
    create_table :creatures do |t|
      t.string :name
      t.integer :price
      t.references :creatures, polymorphic: true, index: true

      t.timestamps
    end
  end
end
