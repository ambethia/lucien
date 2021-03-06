class Book < ActiveRecord::Base
  belongs_to :uploader, :class_name => 'User'
  has_attached_file :document,
                    :url  => "/books/:id/document",
                    :path => ":rails_root/db/assets/documents/:id/:basename.:extension"

  acts_as_taggable_on :tags

  define_index do
    indexes title,     :sortable => true
    indexes author,    :sortable => true
    indexes copyright, :sortable => true
    indexes edition
    indexes publisher, :sortable => true
    indexes asin
    indexes isbn
    indexes comment

    indexes uploader(:name), :as => :uploader, :sortable => true
    indexes tags(:name),     :as => :tags

    has tags(:id), :as => :tag_ids
    has uploader_id, created_at, updated_at
    set_property :delta => true
  end

  def document_type
    ext = document.try(:original_filename) || ''
    File.extname(ext).gsub(/^\./, '').upcase
  end

  def lookup_default
    if title.blank?
      fn = document.try(:original_filename) || ''
      fn = File.basename(fn, File.extname(fn))
      fn.gsub(/[^a-zA-Z0-9]/, ' ').squish
    else
      title
    end
  end

  module Search
    class << self
      def [] query
        return search(query).items.inject([]) do |books, book|
          books << {
            :asin      => book.get('asin'),
            :isbn      => book.get('itemattributes/ean'),
            :title     => book.get('itemattributes/title'),
            :author    => book.get('itemattributes/author'),
            :edition   => book.get('itemattributes/edition'),
            :publisher => book.get('itemattributes/Publisher'),
            :copyright => book.get('itemattributes/PublicationDate'),
            :cover_uri => book.get('smallimage/url')
          }
          books
        end
      end

      def search query
        Amazon::Ecs.item_search query, :response_group => 'ItemAttributes,Images'
      end
    end
  end
end
