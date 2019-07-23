class RecipeIngredient
    @@all = []

    attr_accessor :ingredient, :recipe

    def initialize(recipe, ingredient)
        @ingredient = ingredient
        @recipe = recipe
        @@all << self
    end

    def self.all
        @@all
    end
end