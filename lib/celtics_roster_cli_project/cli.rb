class CelticsRosterCliProject::CLI 
  
  def call 
    CelticsRosterCliProject::Scraper.new.create_the_players
    puts "Welcome to the current roster for the Boston Celtics"
    list_players
    display_player
  end 
  
  def list_players
    puts " "
    puts "Below is the current roster:"
    @players = CelticsRosterCliProject::Player.all
    @players.each.with_index(1) do |player, i|
      puts "#{i}. #{player.name}"
    end
    puts " "
  end
 
  def display_player
    input = nil 
    while input != "exit"
    puts "Please enter the number of the player you would like additional information on."
    input = gets.strip
    if input.to_i > 0 && input.to_i < @players.length
    player = @players[input.to_i-1]
    CelticsRosterCliProject::Scraper.new.scrape_player_details(player) if player.position == nil
    puts " "
    puts "#{player.name} - #{player.position}"
    puts " "
    puts "Height/weight:    #{player.body}"
    puts "Age:              #{player.age}"
    puts "Hometown:         #{player.hometown}"
    puts "School:           #{player.school}"
    puts "Yrs Experience:   #{player.experience}"
    puts " "
    puts "***Season Stats***"
    puts " "
    puts "Points/game:      #{player.points}"
    puts "Rebounds/game:    #{player.rebounds}"
    puts "Assists/game:     #{player.assists}"
    puts "Field Goal %:     #{player.field_goal}"
    puts " "
    else 
    puts " "
    puts "That is not a player, please select again"
    list_players
    display_player
    end
    puts "Would you like to see information on another player? Type Yes or No"
    input = gets.strip.downcase
    if input == "yes"
      list_players
    elsif input == "no"
      puts "Goodbye. Go Celtics!"
      exit
    else 
      puts " "
      puts "I did not understand your answer:"
      list_players
    end
    end
  end
end