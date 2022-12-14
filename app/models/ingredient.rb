class Ingredient < ApplicationRecord
  validates :name,  presence: true
  validates :price, presence: true
  validates :unit,  presence: true
end
