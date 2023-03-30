# frozen_string_literal: true

# Handle computation
class Computation < ApplicationRecord
  has_and_belongs_to_many :ingredients
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
