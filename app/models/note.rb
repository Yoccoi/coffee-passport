class Note < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :content, presence: true
end
