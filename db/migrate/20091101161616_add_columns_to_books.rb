class AddColumnsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :asin, :string
    add_column :books, :isbn, :string
    add_column :books, :cover_uri, :string
    add_column :books, :comment, :text
  end

  def self.down
    remove_column :books, :comment
    remove_column :books, :cover_uri
    remove_column :books, :isbn
    remove_column :books, :asin
  end
end
