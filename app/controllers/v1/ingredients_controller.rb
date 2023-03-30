# frozen_string_literal: true

module V1
  # Handle ingredients
  class IngredientsController < ApplicationController
    def index
      ingredients = Ingredient.all.order('id DESC')
      render json: ingredients, status: ingredients.empty? ? 204 : 200
    end

    def show
      ingredient = Ingredient.find_by(id: params[:id])
      return render json: ingredient, status: 200 if ingredient

      render json: { error: 'Ingredient Not Found' }
    end

    def create
      begin
        ingredient = Ingredient.new(ingredient_params)
      rescue ArgumentError => e
        return render json: { error: e }, status: 400
      end

      return render json: ingredient, status: 201 if ingredient.save

      render json: { error: ingredient.errors }, status: 400
    end

    def destroy
      ingredient = Ingredient.find_by(id: params[:id])

      return render json: { error: 'Ingredient Not Found.' }, status: 404 unless ingredient

      ingredient.delete
    end

    def update
      ingredient = Ingredient.find_by(id: params[:id])

      return render json: ingredient, status: 200 if ingredient.update(ingredient_params)

      render json: { error: ingredient.errors }, status: 400
    end

    private

    def ingredient_params
      params.require(:ingredient).permit(%i[name price unit origin_animal average_weight])
    end
  end
end
