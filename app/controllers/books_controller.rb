class BooksController < ApplicationController
  before_action :correct_user, only: [:edit,]

  def index
    @book = Book.new
    @books = Book.all
    
  end

  def show
   @books = Book.new
   @book = Book.find(params[:id])
   @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    flash[:notice] = "You have created book successfully."
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path
    else
      render :edit
    end
    books = Book.new(book_params)
    books.save
    flash[:notice] = "You have update book successfully."
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
