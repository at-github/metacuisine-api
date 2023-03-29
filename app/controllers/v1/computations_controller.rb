# frozen_string_literal: true

module V1
  # Handle computations
  class ComputationsController < ApplicationController
    def index
      computations = Computation.all.order('id DESC')
      render json: computations, status: computations.empty? ? 204 : 200
    end
  end
end
