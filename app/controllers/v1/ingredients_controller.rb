class V1::IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all
    render json: ingredients, statuss: 200
  end

  def show
  end
end
