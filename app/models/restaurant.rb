class Restaurant < ApplicationRecord
  has_many :user_restaurants
  has_many :attender, class_name: "User", through: :user_restaurants
  belongs_to :host, class_name: "User", foreign_key: :seller_id, optional: true
  has_one_attached :image

  has_many :messages

  validates :address, presence: true
  validates :capacity, presence: true
  validates :price, presence: true
  validates :catchcopy, presence: true
  validates :shop_name, presence: true
  validates :reserve_date, presence: true
  validates :reserve_time, presence: true
  validates :comment, length: { maximum: 200 }
end