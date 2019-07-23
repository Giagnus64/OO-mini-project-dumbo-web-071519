#require_relative '../config/environment.rb'
require 'pry'
require_relative '../app/models/Allergy.rb'
require_relative '../app/models/User.rb'
require_relative '../app/models/Ingredient.rb'
require_relative '../app/models/RecipeCard.rb'
require_relative '../app/models/RecipeIngredient.rb'
require_relative '../app/models/Recipe.rb'

r1 = Recipe.new("Ratatouille")
r2 = Recipe.new("Pizza")
r3 = Recipe.new("Sandwich")

i1 = Ingredient.new("Cheese")
i2 = Ingredient.new("Bread")
i3 = Ingredient.new("Tomato")
i4 = Ingredient.new("Ham")
i5 = Ingredient.new("Dough")

# connects INGREDIENTS and RECIPE
ri1 = RecipeIngredient.new(r3, i4)
ri2 = RecipeIngredient.new(r3, i3)
ri3 = RecipeIngredient.new(r3, i2)
ri4 = RecipeIngredient.new(r3, i1)
ri5 = RecipeIngredient.new(r2, i1)
ri6 = RecipeIngredient.new(r2, i3)
ri7 = RecipeIngredient.new(r2, i5)

u1 = User.new("Bob")
u2 = User.new("Tom")
u3 = User.new("Jack")
u4 = User.new("Lisa")

rc1 = RecipeCard.new(u1, r1, 7, "2015-07-07")
rc2 = RecipeCard.new(u1, r2, 9, "2018-05-06")
rc3 = RecipeCard.new(u1, r3, 1, "2010-12-01")
rc3 = RecipeCard.new(u2, r2, 2, "2010-04-01")
rc4 = RecipeCard.new(u3, r3, 10, "2019-02-12")

a1 = Allergy.new(i1, u3)
a2 = Allergy.new(i3, u4)
a3 = Allergy.new(i3, u3)
a4 = Allergy.new(i5, u4)







binding.pry

puts "end"
