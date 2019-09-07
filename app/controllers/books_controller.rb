class BooksController < ApplicationController
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
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.valid?
      book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(book.id)
    else
      flash[:error] = "ERROR: Book title and body can't be blank."
      redirect_to user_path(current_user.id)
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
