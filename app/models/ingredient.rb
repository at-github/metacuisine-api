# frozen_string_literal: true

# Handle ingredient
class Ingredient < ApplicationRecord
  has_and_belongs_to_many :computations
  validates :name,  presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true
  validates :unit,  presence: true

  enum unit: { kg: 'kg', unit: 'unit' }
end
