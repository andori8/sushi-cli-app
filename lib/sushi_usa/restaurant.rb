class Restaurant
  attr_accessor :name, :city, :url
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end
end
