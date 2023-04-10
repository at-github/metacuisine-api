# frozen_string_literal: true

# Handle computation
class Computation < ApplicationRecord
  has_and_belongs_to_many :ingredients
  validates :title, presence: { message: 'Title is mandatory' }, uniqueness: { case_sensitive: false }
  validates_associated :ingredients
end
