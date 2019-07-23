class User

    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def recipe_cards
         RecipeCard.all.select do |recipe_card|
            recipe_card.user == self
        end
    end

    def recipes
        my_cards = self.recipe_cards
        my_cards.map do |my_card|
            my_card.recipe
        end
    end

    def add_recipe_card(recipe_obj, rating, date)
        RecipeCard.new(self, recipe_obj, rating, date)
    end

    def declare_allergy(ingredient_obj)
        Allergy.new(ingredient_obj, self)
    end

    def allergens
        allergies = Allergy.all.select do |allergy|
            allergy.user == self
        end
        allergies.map do |allergy|
            allergy.ingredient
        end
    end

    def top_three_recipes
         sorted_recipe_cards = self.recipe_cards.sort_by{|recipe_card| recipe_card.rating}
         # pull last three objects in array
         reversed = sorted_recipe_cards.reverse
         # pull recipes from objects
         first_three = reversed.slice(0, 3)
         first_three.map{|recipe_card| recipe_card.recipe}
    end

    def most_recent_recipe
        sorted_recipe_cards = self.recipe_cards.sort_by{|recipe_card| recipe_card.date}
        sorted_recipe_cards.first.recipe
    end
    
    def safe_recipes
        dangerous = []
        self.allergens.each {|allergen|
            dangerous_arr = Recipe.all.select{|recipe|
                recipe.has_ingredient?(allergen)
            }
            dangerous.push(dangerous_arr)
        }
        bad_foods = dangerous.flatten.uniq
        Recipe.all.select{|recipe| !bad_foods.include?(recipe)}
    end   
end