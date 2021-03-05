require 'open-uri'
require 'json'
puts 'Start Seeeding!'
# Seed Ingredients
Cocktail.destroy_all
Ingredient.destroy_all
data = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
cocktails = JSON.parse(data)

cocktails['drinks'].each do |ingredient|
  name = ingredient['strIngredient1']
  Ingredient.create!(name: name)
end

# Seed cocktails
pictures = %w[
  https://images.unsplash.com/photo-1550426735-c33c7ce414ff?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Y29ja3RhaWx8ZW58MHwxfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1551538827-9c037cb4f32a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8Y29ja3RhaWx8ZW58MHwxfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1587223962930-cb7f31384c19?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8Y29ja3RhaWx8ZW58MHwxfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1563223771-5fe4038fbfc9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Y29ja3RhaWx8ZW58MHwxfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1486947799489-3fabdd7d32a6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTV8fGNvY2t0YWlsfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1562707904-8280ad4e2bb0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjB8fGNvY2t0YWlsfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1563223771-375783ee91ad?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fGNvY2t0YWlsfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1593381119286-9af9939cee96?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njd8fGNvY2t0YWlsfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1468465236047-6aac20937e92?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njh8fGNvY2t0YWlsfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1574026266411-b4256800b9eb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTA0fHxjb2NrdGFpbHxlbnwwfDF8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1613934619052-27d9464c8819?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI2fHxjb2NrdGFpbHxlbnwwfDF8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
  https://images.unsplash.com/photo-1607446045875-de57c995726b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8Y29ja3RhaWxzfGVufDB8MXwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60
]

# dose = ['2 cups', '1 liter', '2 spoons', 'just a bit', 'a cup', 'half glass']
def random_ingredient
  Ingredient.all.sample
end

pictures.each do |pic|
  name = Faker::FunnyName.two_word_name
  cocktail = Cocktail.new(name: name)
  file = URI.open(pic)
  cocktail.photo.attach(io: file, filename: "#{name.gsub(' ', '_')}.jpeg", content_type: 'image/jpeg')
  cocktail.save!
  3.times do
    Dose.create!(description: Faker::Food.measurement, ingredient: random_ingredient, cocktail: cocktail)
  end
  4.times do
    Review.create!(content: Faker::Movies::StarWars.quote, rating: rand(1..5), cocktail: cocktail)
  end
end
puts 'Done !!! 🌱'
