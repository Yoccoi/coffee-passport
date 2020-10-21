class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notes, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: { case_sensitive: false }
    validates :password
    validates :password_confirmation
    validates :birthday
  end
end
