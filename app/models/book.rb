class Book < ActiveRecord::Base
  belongs_to :uploader, :class_name => 'User'
  has_attached_file :document,
                    :url  => "/books/:id/document",
                    :path => ":rails_root/db/assets/documents/:id/:basename.:extension"
end
