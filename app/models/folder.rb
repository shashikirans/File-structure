class Folder < ActiveRecord::Base
  # acts_as_tree
  #acts_as_tree 
  belongs_to :user
  has_many :assets, :dependent => :destroy

  # has_ancestry
   acts_as_nested_set
  include TheSortableTree::Scopes

end
