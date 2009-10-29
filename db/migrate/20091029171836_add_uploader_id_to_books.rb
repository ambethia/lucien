class AddUploaderIdToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :uploader_id, :integer
  end

  def self.down
    remove_column :books, :uploader_id
  end
end
