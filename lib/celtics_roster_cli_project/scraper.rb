class CelticsRosterCliProject::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/"))
  end 
  
  def scrape_roster
    self.get_page.search("div.TableBase-overflow tbody td")
  end 
  
  def create_the_players
    scrape_roster.each do |player|
      CelticsRosterCliProject::Player.new_player(player)
    end
  end
  
end
