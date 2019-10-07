module ApplicationHelper
  # current_userがuserをフォローしているか
  def follow?(user)
    followers = Follow.where(follow_id: current_user.id)
    followers.where(follower_id: user.id).exists?
  end
end
