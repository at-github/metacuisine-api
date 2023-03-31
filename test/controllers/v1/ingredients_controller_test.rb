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

    test 'should not create and show new resource without name' do
      post v1_ingredients_url, params: { ingredient: { price: 0.01, unit: 'kg' } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal ["can't be blank"], response['error']['name']
    end

    test 'should not create and show new resource with name already taken' do
      ingredient = Ingredient.new({ name: 'Already taken', price: 0, unit: 'kg' })
      ingredient.save
      post v1_ingredients_url, params: { ingredient: { name: 'already taken', price: 0.01, unit: 'kg' } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal ['has already been taken'], response['error']['name']
    end

    test 'should not create and show new resource without price' do
      post v1_ingredients_url, params: { ingredient: { name: 'Without price', unit: 'kg' } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal ["can't be blank"], response['error']['price']

      ingredient = Ingredient.last
      assert_not 'Without price' == ingredient.name
    end

    test 'should not create and show new resource without unit' do
      post v1_ingredients_url, params: { ingredient: { name: 'Without unit', price: 0.02 } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal ["can't be blank"], response['error']['unit']

      ingredient = Ingredient.last
      assert_not 'Without price' == ingredient.name
    end

    test 'should create and show new resource' do
      post v1_ingredients_url, params: { ingredient: { name: 'New', price: 0.01, unit: 'kg' } }
      assert_response :created

      ingredient = JSON.parse @response.body
      assert_equal 'New', ingredient['name'], 'Resource must have the right name'
      assert_equal 0.01, ingredient['price'], 'Resource must have the right price'
    end
  end
end
