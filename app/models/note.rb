class Note < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :shop

  validates :name, presence: true
  validates :rating, presence: true
end
