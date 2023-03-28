# frozen_string_literal: true

Ingredient.destroy_all

Ingredient.create!(
  [
    {
      name: 'Farine T65',
      price: 1.29,
      unit: 'kg'
    },
    {
      name: 'Sel fin',
      price: 1.95,
      unit: 'kg'
    },
    {
      name: 'Levure sèche',
      price: 37.75,
      unit: 'kg'
    },
    {
      name: 'Sucre semoule',
      price: 2.57,
      unit: 'kg'
    },
    {
      name: 'Huile d’olives Grecque',
      price: 9.97,
      unit: 'kg'
    }
  ]
)

puts "Created #{Ingredient.count} ingredients"
