class AddAverageWeightToIngredient < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :average_weight, :string
  end
end
