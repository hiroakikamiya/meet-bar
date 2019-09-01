class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :restaurants
  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants
  has_one_attached :avatar

  mount_uploader :image, ImageUploader
  validates :name, length: { in: 1..20}
end
