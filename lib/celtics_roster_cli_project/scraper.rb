class CelticsRosterCliProject::Scraper
  
  def scrape_roster
    doc = Nokogiri::HTML(open("https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/"))
    doc.search("div.TableBase-overflow tbody tr")
  end 
  
  def create_the_players
    scrape_roster.each do |player|
      self.new_player(player)
    end
  end
  
  def new_player(player)
    CelticsRosterCliProject::Player.new(
      player.search("span.CellPlayerName--long a").text, #creates player name
      "https://www.cbssports.com#{player.search("span.CellPlayerName--long a").attribute('href')}" #creates player url
      )
  end
  
  def scrape_player_details(player)
    page = Nokogiri::HTML(open(player.url))
    player.body = page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(2)").text
    player.age = page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(6)").text
    player.hometown = page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(8)").text
    player.school = page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(12)").text
    player.experience = page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(14)").text
    player.points = page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(3)").text
    player.rebounds = page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(4)").text
    player.assists = page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(5)").text
    player.field_goal = page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(6)").text
    player.position = page.search("div.row.row-no-pad h1 span:nth-child(3)").text
  end
  
end
