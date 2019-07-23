class Allergy

    @@all = []

    attr_accessor :ingredient, :user

    def initialize(ingredient, user)
        @ingredient = ingredient
        @user = user
        @@all << self
    end

    def self.all
        @@all
    end

    def self.ingredients
        @@all.map do |allergy|
            allergy.ingredient
        end
    end

    def self.allergy_by_ingredient(ingredient)
        self.all.select {|allergy| allergy.ingredient == ingredient}
    end
    
end