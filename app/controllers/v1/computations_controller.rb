# frozen_string_literal: true

module V1
  # Handle computations
  class ComputationsController < ApplicationController
    def index
      computations = Computation.all.order('id DESC')
      render json: computations, include: :ingredients, status: computations.empty? ? 204 : 200
    end

    def show
      computation = Computation.find_by(id: params[:id])
      return render json: computation, include: :ingredients, status: 200 if computation

      render json: { error: 'Ingredient Not Found' }
    end
  end
end
