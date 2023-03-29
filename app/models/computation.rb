# frozen_string_literal: true

# Handle computation
class Computation < ApplicationRecord
  validates :title,  presence: true, uniqueness: { case_sensitive: false }
end
