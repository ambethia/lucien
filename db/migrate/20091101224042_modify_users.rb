class ModifyUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :login, :string, :default => nil, :null => true
    add_column :users, :single_access_token, :string, :default => '', :null => false
    add_column :users, :perishable_token, :string, :default => '', :null => false
    add_column :users, :failed_login_count, :integer, :default => 0, :null => false
    add_column :users, :invitation_id, :integer
    add_column :users, :invitation_limit, :integer, :default => 0, :null => false
    add_column :users, :admin, :boolean

    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    add_index :users, :openid_identifier
  end

  def self.down
    remove_column :users, :failed_login_count
    remove_column :users, :perishable_token
    remove_column :users, :single_access_token
    remove_column :users, :login
    remove_column :admin, :admin
    remove_column :users, :invitation_limit
    remove_column :users, :invitation_id
  end
end
