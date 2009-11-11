class BooksController < ApplicationController
  before_filter :require_user

  # GET /books
  def index
    @books = Book.all
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = current_user.books.new
  end

  # GET /books/1/edit
  def edit
    @book = current_user.books.find(params[:id])
  end

  # POST /books
  def create
    @book = current_user.books.new(params[:book])

    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to([:edit, @book])
    else
      render :action => "new"
    end
  end

  # PUT /books/1
  def update
    @book = current_user.books.find(params[:id])

    if @book.update_attributes(params[:book])
      flash[:success] = 'Book was successfully updated.'
      redirect_to(@book)
    else
      render :action => "edit"
    end
  end

  # DELETE /books/1
  def destroy
    @book = current_user.books.find(params[:id])
    @book.destroy
    redirect_to(books_url)
  end

  # GET /books/1/document
  def document
    @book = Book.find(params[:id])
    send_file @book.document.path,
              :type        => @book.document_content_type,
              :x_sendfile  => (true if Rails.env == 'production'),
              :disposition => 'inline'
  end

  # GET /books/lookup
  def lookup
    @books = Book::Search[params[:query]]
  end
end
