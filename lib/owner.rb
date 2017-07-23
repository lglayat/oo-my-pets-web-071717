require "pry"

class Owner
  # code goes here
  attr_accessor :pets, :name

  @@all = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species , animal|
      animal.each do |pet|
        pet.mood = "nervous"
      end
      animal.clear
    end
  end

  def list_pets
    val = "I have "
    @pets.each do |species , animal|
      # binding.pry

      if species == :fishes
        spec = "fish"
      elsif species == :cats
        spec = "cat(s)"
      elsif species == :dogs
        spec = "dog(s)"
      end

      val += "#{animal.count} #{spec}, "
    end


    val = val[0..-3]
    first = val[0..-9]
    last = val[-8..-1]
    returnVal = first + "and " + last + "."

  

    returnVal
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.size
  end

  def species
    return "human"
  end

  def say_species
    return "I am a human."
  end


end
