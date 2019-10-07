class Book < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy
  validates :body,  length: { maximum: 200 }
  validates :title, :body, presence: true
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
