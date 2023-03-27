class Ingredient < ApplicationRecord
  validates :name,  presence: true, uniqueness: { case_sensitive: false}
  validates :price, presence: true
  validates :unit,  presence: true

  enum unit: %i[kg unit]
end
