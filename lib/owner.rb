class Owner
  attr_reader :species
  attr_accessor :name, :pets, :fish, :dog, :cat

  @@all = []


  def initialize(species)
    @species = species
    @name = name
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @pets
  end

  def buy_fish(fish)
    @pets[:fishes] << Fish.new(fish)
  end

  def buy_cat(cat)
    @pets[:cats] << Cat.new(cat)
  end

  def buy_dog(dog)
    @pets[:dogs] << Dog.new(dog)
  end

  def walk_dogs
    @pets.collect do |species, instances|
      if species == :dogs
        instances.each do |dog|
          dog.mood = "happy"
        end
      end
    end
 end

  def play_with_cats
    @pets.collect do |species, instances|
      if species == :cats
        instances.each do |cat|
          cat.mood = "happy"
        end
      end
    end
  end



  def feed_fish
     @pets.collect do |species, instances|
       if species == :fishes
         instances.each do |fish|
           fish.mood = "happy"
         end
       end
     end
  end



  def list_pets
    num_dogs = @pets[:dogs].size
    num_cats = @pets[:cats].size
    num_fish = @pets[:fishes].size
    return "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

  def sell_pets
      @pets.each do |species, instances|
        instances.each do |pet|
          pet.mood = "nervous"
        end
        instances.clear
      end
  end

end
