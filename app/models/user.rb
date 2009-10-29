class User < ActiveRecord::Base
  has_many :books, :foreign_key => 'uploader_id'
  acts_as_authentic
end
