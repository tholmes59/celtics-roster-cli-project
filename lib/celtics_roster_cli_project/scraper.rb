class CelticsRosterCliProject::Scraper
  
  def scrape_roster
    doc = Nokogiri::HTML(open("https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/"))
    doc.search("div.TableBase-overflow tbody tr")
  end 
  
  def create_the_players
    scrape_roster.each do |player|
      CelticsRosterCliProject::Player.new_player(player)
    end
  end
  
  def self.new_player(player)
    self.new(
      player.search("span.CellPlayerName--long a").text, #creates player name
      "https://www.cbssports.com#{player.search("span.CellPlayerName--long a").attribute('href')}" #creates player url
      )
  end
  
end
