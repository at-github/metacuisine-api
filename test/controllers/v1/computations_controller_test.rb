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
  end
end
