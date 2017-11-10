# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

list = open(url).read

parsed = JSON.parse(list)

puts "Clearing the db..."
Ingredient.destroy_all

puts "Seeding the db..."

ingredients = parsed["drinks"]

ingredients.each do |i|
  value = i["strIngredient1"]
  Ingredient.create!({name: value})
  puts "#{value} has been added to the db"
end

puts "Seeds created"
