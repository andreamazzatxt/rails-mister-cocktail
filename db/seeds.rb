require 'open-uri'
require 'json'
puts 'Start Seeeding!'

data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
cocktails = JSON.parse(data)

cocktails['drinks'].each do |ingredient|
  name = ingredient['strIngredient1']
  Ingredient.create!(name: name)
end
puts 'Done !!! 🌱'
