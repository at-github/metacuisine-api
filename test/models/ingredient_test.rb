# frozen_string_literal: true

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  test 'should not save ingredient without name' do
    ingredient = Ingredient.new
    assert_not ingredient.save, 'Saved ingredient without name'
  end

  test 'should not save ingredient with duplicate name' do
    ingredient_one = Ingredient.new({ name: 'name', price: 0, unit: 'kg' })
    assert ingredient_one.save

    ingredient_two = Ingredient.new({ name: 'name', price: 0, unit: 'kg' })
    assert_not ingredient_two.save, 'Saved ingredient with name already exist'

    ingredient_three = Ingredient.new({ name: 'name', price: 0, unit: 'kg' })
    assert_not ingredient_three.save, 'Saved ingredient with name already exist but different case'
  end

  test 'should not save ingredient without price' do
    ingredient = Ingredient.new({ name: 'name', unit: 'kg' })
    assert_not ingredient.save, 'Saved ingredient without price'
  end

  test 'should not save ingredient without unit' do
    ingredient = Ingredient.new({ name: 'name', price: 0})
    assert_not ingredient.save, 'Saved ingredient without unit'
  end

  test 'should save ingredient' do
    ingredient_one = Ingredient.new({ name: 'name', price: 1.5, unit: 'kg' })
    assert ingredient_one.save, 'Save ingredient with expected data'
  end
end
