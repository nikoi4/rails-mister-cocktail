# frozen_string_literal: true

require 'json'
require 'open-uri'

puts 'deleting records'
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
data = JSON.parse(json)

puts 'Starting seed'

data['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts 'End of seed'
