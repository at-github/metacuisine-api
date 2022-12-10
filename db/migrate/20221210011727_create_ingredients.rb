class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :price
      t.string :unit
      t.boolean :origin_animal

      t.timestamps
    end
  end
end
