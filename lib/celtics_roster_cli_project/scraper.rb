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
  
  def page
    @page ||= Nokogiri::HTML(open(self.url))
  end 
  
  def body
    @body ||= page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(2)").text
  end 
  
  def age
    @age ||= page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(6)").text
  end 
  
  def hometown
    @hometown ||= page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(8)").text
  end
  
  def school
    @school ||= page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(12)").text
  end
  
  def experience
    @experience ||= page.search("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(14)").text
  end
  
  def points
    @points ||= page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(3)").text
  end
  
  def rebounds
    @rebounds ||= page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(4)").text
  end
  
  def assists
    @assists ||= page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(5)").text
  end
  
  def field_goal
    @field_goal ||= page.search("div.stats.fRight.stdMargin tr:nth-child(3) td:nth-child(6)").text
  end
  
  def position
    @position ||= page.search("div.row.row-no-pad h1 span:nth-child(3)").text
  end
  
end
