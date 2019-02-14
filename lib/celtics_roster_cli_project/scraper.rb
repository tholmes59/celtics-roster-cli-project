class CelticsRoster::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/"))
  end 
  
  def scrape_players
    get_page.search("div.TableBase-overflow tbody td")
  end 
  
end
