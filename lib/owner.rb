require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def say_species
   "I am a #{@species}."
  end
  
  def cats
    Cat.all.select {|c| c.owner == self}
  end
  
  def dogs
    Dog.all.select {|d| d.owner == self}
  end
  
  def buy_cat(name)
   cat = Cat.new(name, self)
  end
  
  def buy_dog(name)
   dog = Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    self.dogs.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets  
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
   end
    
end