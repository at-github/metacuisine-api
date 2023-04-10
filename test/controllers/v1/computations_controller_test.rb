# frozen_string_literal: true

require 'test_helper'

module V1
  class ComputationsControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get v1_computations_url
      assert_response :success

      computations = JSON.parse @response.body
      assert_operator 0, :<, computations.count

      computations.each do |computation|
        assert computation.key? 'title'
        assert computation.key? 'ingredients'
      end
    end

    test 'should get show' do
      get v1_computation_url(Computation.find_by(title: 'Chiffrage avec des ingrédients'))
      assert_response :success

      computation = JSON.parse @response.body
      assert computation.key? 'title'
      assert computation.key? 'ingredients'

      computation['ingredients'].each do |ingredient|
        assert ingredient.key? 'name'
        assert ingredient.key? 'price'
        assert ingredient.key? 'unit'
      end
    end

    test 'should not create and show new resource without title' do
      computations_count = Computation.all.count
      post v1_computations_url, params: { computation: { ingredients: [{ id: Ingredient.first.id }] } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal ['Title is mandatory'], response['error']['title']
      assert_equal computations_count, Computation.all.count
    end

    test 'should not create and show new resource with name already taken' do
      computation = Computation.new({ title: 'Already taken' })
      computation.save
      computations_count = Computation.all.count

      post v1_computations_url, params: { computation: { title: 'already taken' } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal ['has already been taken'], response['error']['title']
      assert_equal computations_count, Computation.all.count
    end

    test 'should not create and show new resource with invalid ingredient' do
      computations_count = Computation.all.count
      post v1_computations_url, params: { computation: { title: 'With invalid ingredient', ingredients: [{ id: 0 }] } }
      assert_response 400

      response = JSON.parse @response.body
      assert_equal "Wrong ingredient id: '0'", response['error']

      computation = Computation.last
      assert_not computation.title == 'With invalid ingredient', 'Computation must no exist'
      assert_equal computations_count, Computation.all.count
    end

    test 'should create and show new resource' do
      computations_count = Computation.all.count
      post v1_computations_url, params: { computation: { title: 'New', ingredients: [{ id: Ingredient.first.id }] } }
      assert_response :created

      response = JSON.parse @response.body
      assert_equal 'New', response['title'], 'Resource must have the right name'

      computation = Computation.last
      assert_operator 0, :<, computation.ingredients.count
      assert_equal computations_count + 1, Computation.all.count
    end
  end
end
