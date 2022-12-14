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

  def create
    ingredient = Ingredient.new(
      name: params[:name],
      price: params[:price],
      unit: params[:unit],
      origin_animal: params[:origin_animal],
      average_weight: params[:average_weight]
    )

    if ingredient.save
      render json: ingredient, status: 201
    else
      render json: {error: ingredient.errors}, status: 400
    end
  end

  private
    def ingredient_params
      params.require(:ingredient).permit([
        :name,
        :price,
        :unit,
        :origin_animal,
        :average_weight,
      ])
    end
end
