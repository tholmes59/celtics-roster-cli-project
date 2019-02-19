class CelticsRosterCliProject::CLI 
  
  def call 
    CelticsRosterCliProject::Scraper.new.create_the_players
    puts "Welcome to the current roster for the Boston Celtics"
    list_players
    display_player
    
    #call a method to display individual players
    #goodbye method
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
    puts "Please enter the number of the player you would like additional information on, or type exit."
    input = gets.strip 
    player = @players[input.to_i-1]
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
 end
    
    
    # stats 
    #puts points per game 
    #puts rebounds per game
    #puts assists per game
    #puts field goal percentage
  end
  
  
end