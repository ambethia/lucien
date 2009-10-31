class Book < ActiveRecord::Base
  belongs_to :uploader, :class_name => 'User'
  has_attached_file :document,
                    :url  => "/books/:id/document",
                    :path => ":rails_root/db/assets/documents/:id/:basename.:extension"

  def document_type
    ext = document.try(:original_filename) || ''
    File.extname(ext).gsub(/^\./, '').upcase
  end
end
