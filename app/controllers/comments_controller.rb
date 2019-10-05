class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  def create
    @book = Book.find(params[:book_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    if comment.save
      flash[:notice] = 'comment was successfully created!'
      redirect_to @book
    else
      flash.new[:error] = 'comment error.'
      render @book
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to book_path(comment.book_id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to book_path(comment.book_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user
    comment = Comment.find(params[:id])
    @user = comment.user
    redirect_to(root_url) unless current_user == @user
  end
end
