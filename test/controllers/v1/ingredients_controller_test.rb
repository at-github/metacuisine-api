# frozen_string_literal: true

require 'test_helper'

module V1
  class IngredientsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get v1_ingredients_url
      assert_response :success

      ingredients = JSON.parse @response.body
      assert_operator 0, :<, ingredients.count

      ingredients.each do |ingredient|
        assert ingredient.key? 'name'
        assert ingredient.key? 'price'
        assert ingredient.key? 'unit'
      end
    end

    test 'should get show' do
      get v1_ingredient_url(Ingredient.first)
      assert_response :success

      ingredient = JSON.parse @response.body
      assert ingredient.key? 'name'
      assert ingredient.key? 'price'
      assert ingredient.key? 'unit'
    end
  end
end
