class Scraper

  def self.scrape_restaurants
    html = "http://welovejapanesefood.com/10-best-sushi-restaurants-in-the-united-states/"
    doc = Nokogiri::HTML(open(html))
    i = 0
    while i < 15 do
      restaurant = doc.css("ol li a")[i].text
      restaurant_name = restaurant.split(restaurant[/\(.*?\)/]).first.strip
    end
  end
end
