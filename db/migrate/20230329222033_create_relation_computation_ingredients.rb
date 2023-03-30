class CreateRelationComputationIngredients < ActiveRecord::Migration[7.0]
  create_table :computations_ingredients, id: false do |t|
    t.belongs_to :computation
    t.belongs_to :ingredient
  end
end
