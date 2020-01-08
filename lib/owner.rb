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
   cats
  end
  
  def buy_dog(name)
   dog = Dog.new(name, self)
  end
    
  
    
end