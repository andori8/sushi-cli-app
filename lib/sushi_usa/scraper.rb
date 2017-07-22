class Scraper

  def self.scrape_restaurants
    html = "http://welovejapanesefood.com/10-best-sushi-restaurants-in-the-united-states/"
    doc = Nokogiri::HTML(open(html))
    i = 0
    while i < 15 do
      restaurants = doc.css("ol li a")[i].text
      restaurants_name = restaurants.split(restaurants[/\(.*?\)/]).first.strip
      restaurant = Restaurant.new(restaurants_name)
      restaurant.city = restaurants[/\(.*?\)/].delete('()')
      i += 1
    end
  end
end
