class AddFieldsToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :lft, :integer
    add_column :assets, :rgt, :integer
    add_column :assets, :depth, :integer
    add_column :assets, :secret_field, :integer
  end
end
