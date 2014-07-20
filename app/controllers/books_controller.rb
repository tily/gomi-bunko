class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.where(:sound_index => params[:sound])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @author = Author.where(:name => params[:author_name]).first
    @book = Book.where(:author_id => @author.id, :title => params[:book_title]).first

    respond_to do |format|
      format.html { render :layout => false }
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @author = Author.where(:name => params[:author_name]).first
    @book = Book.where(:author_id => @author.id, :title => params[:book_title]).first
  end

  # POST /books
  # POST /books.json
  def create
    @author = Author.where(:name => params[:author_name]).first
    @book = @author.books.new(params[:book])
    @book.creator = session[:twitter]

    respond_to do |format|
      if @book.save
        format.html { redirect_to book_path(@author.name, @book.title), notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @author = Author.where(:name => params[:author_name]).first
    @book = Book.where(:title => params[:book_title]).first
    @book.updater = session[:twitter]

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to book_path(@author.name, @book.title), notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
end
