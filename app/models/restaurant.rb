class Restaurant < ApplicationRecord
  has_many :user_restaurants
  has_many :users, through: :user_restaurants
  has_many :images
  accepts_nested_attributes_for :images
end


