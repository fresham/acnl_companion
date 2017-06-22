class RemoveNameFromFish < ActiveRecord::Migration[5.1]
  def change
    remove_column :fish, :name, :string
  end
end
