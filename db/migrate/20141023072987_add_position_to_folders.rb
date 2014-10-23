class AddPositionToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :position, :string
  end
end
