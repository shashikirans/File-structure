class Asset < ActiveRecord::Base

 belongs_to :user
 belongs_to :folder
 
#set up "uploaded_file" field as attached_file (using Paperclip)
has_attached_file :uploaded_file,
               :url => "/assets/get/:id",
               :path => ":Rails_root/assets/:id/:basename.:extension"
               
validates_attachment_content_type :uploaded_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

validates_attachment_size :uploaded_file, :less_than => 10.megabytes  
validates_attachment_presence :uploaded_file


   acts_as_nested_set
  include TheSortableTree::Scopes

  
def file_name
    uploaded_file_file_name
end

def file_size
    uploaded_file_file_size
end

end
