class Ingredient
    
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.most_common_allergen
          arr_of_allergies = self.all.map{|ingredient| Allergy.allergy_by_ingredient(ingredient)}
          sorted = arr_of_allergies.sort_by{|arr| arr.size}
          sorted.last[0].ingredient
    end
end
