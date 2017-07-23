class Restaurant
  attr_accessor :name, :id, :city, :url, :reservation, :budget, :address, :phone, :website
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.reset
    self.all.clear
  end
end
