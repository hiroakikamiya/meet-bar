class Message < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :message, length: { maximum: 250 }
end
