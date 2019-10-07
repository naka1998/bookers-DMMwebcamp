class FollowsController < ApplicationController
  def index_follows
    follow_id = params[:format].to_i
    follow = Follow.where(follow_id: follow_id)
    if !!follow
      @users=[]
      follow.each do |f|
        @users.push(User.find(f.follower_id))
      end
      render "follows/index"
    else
      flash[:error] = "This user don't follow any user."
      redirect_back(fallback_location: root_path)
    end
  end

  def index_followers
    follower_id = params[:format].to_i
    follow = Follow.find_by(follower_id: follower_id)
    if !!follow
      @users = User.where(id: follow.follow_id)
      render "follows/index"
    else
      flash[:error] = "This user don't have any follower."
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    follow = Follow.new(follower_id: params[:format], follow_id: current_user.id)
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = Follow.where(follower_id: params[:format])
    follow = follow.find_by(follow_id: current_user.id)
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
end
