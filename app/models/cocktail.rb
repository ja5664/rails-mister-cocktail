class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  # Adding the uploader to the model
  mount_uploader :photo, PhotoUploader
end
