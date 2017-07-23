class Cli
  def call
    list_restaurants
    menu
  end

  def list_restaurants
    puts "Here are the top 15 sushi restaurants in America as of 12/12/2016:"
    Restaurant.reset
    Scraper.scrape_restaurants
    Restaurant.all.each.with_index(1) { |restaurant, i|
    puts "#{i}. #{restaurant.name} - #{restaurant.city}"}
  end

  def menu
    input = nil

    while input != "exit"
    puts "Please choose restaurant (1-15) for more details or type 'list' or 'exit':"
    input = gets.strip.downcase

      if input.to_i.between?(1,15)
        restaurant =Restaurant.all[input.to_i - 1]
        print_details(restaurant)
      elsif input == "list"
        list_restaurants
      elsif input == "exit"
        goodbye
      else
        puts "Not a valid choice."
      end
    end
  end

  def goodbye
    puts "Thank you and good bye!"
  end

  def print_details(restaurant)
    Scraper.scrape_details(restaurant)
    puts <<~DOC
    #{restaurant.name} - #{restaurant.city}
    --------------------------------------
    #{restaurant.reservation}
    #{restaurant.budget}
    #{restaurant.address}
    #{restaurant.phone}
    #{restaurant.website}
    --------------------------------------
    DOC
  end
end
