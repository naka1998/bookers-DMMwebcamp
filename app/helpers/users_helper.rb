module UsersHelper
  # userのフォロワーをすべて格納する
  def follower_of(user)
    Follow.where(follower_id: user.id)
  end

  # userのフォローしているユーザーをすべて格納する
  def follow_user_of(user)
    Follow.where(follow_id: user.id)
  end
end
