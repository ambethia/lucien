class Book < ActiveRecord::Base
  belongs_to :uploader, :class_name => 'User'
  has_attached_file :document
end
