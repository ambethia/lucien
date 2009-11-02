class User < ActiveRecord::Base
  include AuthenticationEngine::User
  include AuthenticationEngine::User::Authorization
  include AuthenticationEngine::User::StateMachine

  has_many :books, :foreign_key => 'uploader_id'
  acts_as_authentic
end
