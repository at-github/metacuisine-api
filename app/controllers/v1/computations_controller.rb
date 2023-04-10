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

      render json: { error: 'Computation Not Found' }
    end

    def create
      computation = Computation.new(computation_params)

      begin
        params['computation']['ingredients']&.map do |ingredient_request|
          computation.ingredients << get_ingredient(ingredient_request['id'])
        end
      rescue ArgumentError => e
        return render json: { error: e }, status: 400
      end

      return render json: { error: computation.errors }, status: 400 unless computation.save

      render json: computation, include: :ingredients, status: 201
    end

    private

    def get_ingredient(ingredient_id)
      ingredient = Ingredient.find_by(id: ingredient_id)
      raise ArgumentError, "Wrong ingredient id: '#{ingredient_id}'" unless ingredient

      ingredient
    end

    def computation_params
      params.require(:computation).permit(%i[title ingredients])
    end
  end
end
