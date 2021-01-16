# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'httparty'

puts "Cleaning database..."
Cocktail.destroy_all

puts "Creating cocktails..."

5.times do
  Cocktail.create(name: "#{Faker::Hipster.word} #{Faker::Hipster.word}")
end

puts "done!"

puts "Cleaning database..."
Ingredient.destroy_all

puts "Creating ingredients..."

file = HTTParty.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
ingredients_hash = JSON.parse(file.body)

10.times do
   Ingredient.create(name: ingredients_hash["drinks"].sample["strIngredient1"])
end

puts "done!"

puts "Cleaning database..."
Dose.destroy_all

puts "Creating doses..."

4.times do
  Dose.create(description: "#{rand(2..5)} parts", cocktail: Cocktail[:id]["#{rand(0..4)}"], ingredient: Ingredient[:id]["#{rand(0..9)}"])
end

puts "done!"

