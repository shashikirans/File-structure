class AddTitleToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :title, :string
  end
end
