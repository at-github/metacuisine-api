class V1::IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all
    render json: ingredients, statuss: 200
  end

  def show
    ingredient = Ingredient.find_by(id: params[:id])
    if ingredient
      render json: ingredient, status: 200
    else
      render json: {error: "Ingredient Not Found."}
    end
  end
end
