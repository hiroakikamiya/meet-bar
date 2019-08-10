class Message < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :message, presence: true
end
