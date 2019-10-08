class Tag < ApplicationRecord
  belongs_to :book
  has_many :descriptions, dependent: :destroy
  accepts_nested_attributes_for :descriptions, allow_destroy: true
  validates :name, presence: true
end
