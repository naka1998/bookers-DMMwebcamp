class Book < ApplicationRecord
  belongs_to :user
  has_many :comment, dependent: :destroy
  has_many :favorite, dependent: :destroy
  validates :body,  length: { maximum: 200 }
  validates :title, :body, presence: true
  def favorited_by?(user)
    favorite.where(user_id: user.id).exists?
  end
end
