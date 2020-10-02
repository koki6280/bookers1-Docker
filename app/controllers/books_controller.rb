class BooksController < ApplicationController
  
  def top
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  end

  def create
     @book = Book.new(book_params)
    if  @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
    else
    	@books = Book.all
    	flash.now[:alert] = 'error'
    	render action: :index
    end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if  @book.update(book_params)
  		flash[:notice] = "Book was successfully updated."
  	    redirect_to book_path(@book)
  	else
  		flash.now[:alert] = 'error'
        render action: :edit
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
  		flash[:notice] = "You have updated book successfully."
        redirect_to books_path(@books)
    else
    	render action: :new
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
