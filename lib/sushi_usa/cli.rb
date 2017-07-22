class SushiUsa::Cli
  def call
    puts "Here are the top 15 sushi restaurants in America as of 2017:"
    list_restaurants
    menu
    goodbye
  end

  def list_restaurants
    puts <<~DOC
    1. Sushi Nakazawa - New York
    2. Sushi on Jones - New York
    DOC
  end

  def menu
    input = nil

    while input != "exit"
    puts "Please choose restaurant (1-15) for more details or type 'list' or 'exit':"
    input = gets.strip.downcase

      if input.to_i.between?(1,15)
        puts "restaurant details"
      elsif input == "list"
        list_restaurants
      else
        puts "Not a valid choice."
      end
    end
  end

  def goodbye
    puts "Thank you and good bye!"
  end
end
