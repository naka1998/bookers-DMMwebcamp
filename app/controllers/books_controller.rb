class BooksController < ApplicationController
  before_action :authenticate_user!
  def home
    if user_signed_in?
      redirect_to user_path(current_user.id)
    end
  end

  def index
    @books = Book.all
    @post = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @post = Book.new
    @comment = Comment.new
    @comments = Comment.where(book_id: @book.id)
    @favos = Favorite.where(book_id: @book.id)
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.valid?
      book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(book.id)
    else
      flash[:error] = "error."
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.valid?
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      flash[:error] = 'error.'
      redirect_to book_path(@book.id)
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, tags_attributes: [:id, :name, 
      :_destroy, descriptions_attributes:[:id, :body]])
  end
end
