class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :openid_identifier
      t.string :persistence_token
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.integer :login_count, :default => 0, :null => false
      t.string :last_login_ip
      t.string :current_login_ip
      t.string :crypted_password
      t.string :password_salt
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
