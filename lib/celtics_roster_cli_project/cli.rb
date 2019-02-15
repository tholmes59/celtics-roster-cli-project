class CelticsRosterCliProject::CLI 
  
  def call 
    CelticsRosterCliProject::Scraper.new.create_player
    puts "Welcome to the current roster for the Boston Celtics"
    list_players
    #initiate the scrape
    #call a method to print a list of players
    #call a method to display individual players
    #goodbye method
  end 
  
  def list_players
    puts " "
    puts "Below is the current roster:"
    CelticsRosterCliProject::Player.all.each.with_index(1) do |player, i|
      puts "#{i}. #{player.url}"
    end
    puts " "
    puts "Please enter the number of the player you would like additional information on, or type exit."
  end
  
  def display_player
    
    
    #puts height/weight
    #puts age 
    #puts hometown
    #puts school
    #puts years of experience
    
    # stats 
    #puts points per game 
    #puts rebounds per game
    #puts assists per game
    #puts field goal percentage
  end
  
  
end