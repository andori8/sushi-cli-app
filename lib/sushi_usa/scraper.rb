class Scraper

  def self.scrape_restaurants
    html = "http://welovejapanesefood.com/10-best-sushi-restaurants-in-the-united-states/"
    doc = Nokogiri::HTML(open(html))
    i = 0
    while i < 15 do
      restaurants = doc.search("ol li a")[i].text
      restaurants_name = restaurants.split(restaurants[/\(.*?\)/]).first.strip
      restaurant = Restaurant.new(restaurants_name)
      restaurant.id = i
      restaurant.city = restaurants[/\(.*?\)/].delete('()').strip
      restaurant.url = html
      i += 1
    end
  end

  def self.scrape_details(restaurant)
    doc = Nokogiri::HTML(open(restaurant.url))
    info = doc.search("fieldset")[restaurant.id].text
    info_array = info.split("\n")
    if info_array.select {|x| x.start_with?("Reservation")}.count > 1
      restaurant.reservation = info_array.detect {|x| x.start_with?("Reservation")}
      restaurant.budget = info_array.select {|x| x.start_with?("Budget")}
      restaurant.address = info_array.select {|x| x.start_with?("Navigation")}
      restaurant.phone = info_array.select {|x| x.start_with?("Ring")}
      restaurant.website = info_array.select {|x| x.start_with?("Surf")}
    elsif info_array[11] == "Surf: sushizo.us"
      restaurant.reservation = info_array.detect {|x| x.start_with?("Reservation")}
      restaurant.budget = info_array.detect {|x| x.start_with?("Budget")}
      restaurant.address = [info_array[7].gsub!(/\P{ASCII}/, '').strip,
      info_array[8].gsub!(/\P{ASCII}/, '').strip, info_array[9].gsub!(/\P{ASCII}/, '').strip]
      restaurant.phone = info_array.detect {|x| x.start_with?("Ring")}
      restaurant.website = info_array.detect {|x| x.start_with?("Surf")}
    else
      restaurant.reservation = info_array.detect {|x| x.start_with?("Reservation")}
      restaurant.budget = info_array.detect {|x| x.start_with?("Budget")}
      restaurant.address = info_array.detect {|x| x.start_with?("Navigation")}
      restaurant.phone = info_array.detect {|x| x.start_with?("Ring")}
      restaurant.website = info_array.detect {|x| x.start_with?("Surf")}
    end
  end
end
