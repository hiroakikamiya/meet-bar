class Image < ApplicationRecord
  belongs_to :restaurant

  validates :image, presence: true
end
