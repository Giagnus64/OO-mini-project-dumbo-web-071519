class Recipe
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def users
       my_cards = RecipeCard.all.select do |card|
            card.recipe == self
        end
        my_cards.map do |card|
            card.user
        end
    end

    def self.most_popular
        most = self.all.first
        self.all.map do |recipe|
           if recipe.users.size > most.users.size
           most = recipe
           end
        end
        most
    end
    
    def ingredients
       my_ingredients=RecipeIngredient.all.select do |recIng|
        recIng.recipe == self
       end 
       my_ingredients.map do |recIng|
        recIng.ingredient
       end

    end
    def allergens
        self.ingredients.select do |ingredient|
            Allergy.ingredients.include?(ingredient)
        end
    end

    def add_ingredients(ingredient_arr)
        ingredient_arr.map do |ingredient|
            RecipeIngredient.new(self,ingredient)
            end
    end

    def has_ingredient?(ingredient)
        self.ingredients.include?(ingredient)
    end
end