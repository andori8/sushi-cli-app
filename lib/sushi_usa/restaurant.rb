class SushiUsa::Restaurant
  attr_accessor :name, :city, :url

  def self.all
    restaurant_1 = self.new
    restaurant_1.name = "Sushi Nakazawa"
    restaurant_1.city = "New York"
    restaurant_1.url = "http://welovejapanesefood.com/10-best-sushi-restaurants-in-the-united-states/#nakazawa"

    restaurant_2 = self.new
    restaurant_2.name = "Sushi on Jones"
    restaurant_2.city = "New York"
    restaurant_2.url = "http://welovejapanesefood.com/10-best-sushi-restaurants-in-the-united-states/#jones"

    [restaurant_1, restaurant_2]
  end
end
