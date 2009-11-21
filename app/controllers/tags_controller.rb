class TagsController < ApplicationController
  before_filter :require_user

  # GET /tags
  def index
    @tags = Book.tag_counts_on(:tags)
  end

  def tags
    @books = Book.tagged_with(params[:tags])
  end
end
