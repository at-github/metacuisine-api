# frozen_string_literal: true

module V1
  # Handle ingredients
  class IngredientsController < ApplicationController
    def index
      ingredients = Ingredient.all.order('id DESC')
      render json: ingredients, status: 200
    end

    def show
      ingredient = Ingredient.find_by(id: params[:id])
      if ingredient
        render json: ingredient, status: 200
      else
        render json: { error: 'Ingredient Not Found.' }
      end
    end

    def create
      ingredient = Ingredient.new(
        name: params[:name],
        price: params[:price],
        unit: params[:unit],
        origin_animal: params[:origin_animal],
        average_weight: params[:average_weight]
      )

      return render json: ingredient, status: 201 if ingredient.save

      render json: { error: ingredient.errors }, status: 400
    end

    def destroy
      ingredient = Ingredient.find_by(id: params[:id])

      return render json: { error: 'Ingredient Not Found.' }, status: 404 unless ingredient

      ingredient.delete
    end

    private

    def ingredient_params
      params.require(:ingredient).permit(%i[name price unit origin_animal average_weight])
    end
  end
end
