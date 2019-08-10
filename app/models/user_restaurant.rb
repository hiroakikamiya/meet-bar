class UserRestaurant < ApplicationRecord
  belongs_to :restaurant
  belongs_to :attender, class_name: "User", foreign_key: :attender_id, optional: true
end
