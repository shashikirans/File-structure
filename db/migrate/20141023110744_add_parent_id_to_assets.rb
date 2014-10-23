class AddParentIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :parent_id, :integer
  end
end
