class AddFieldsToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :lft, :integer
    add_column :folders, :rgt, :integer
    add_column :folders, :depth, :integer
    add_column :folders, :secret_field, :integer
  end
end
