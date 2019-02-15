class CelticsRosterCliProject::Player
  
  attr_accessor :name, :position, :url, :body, :age, :hometown, :school, :experience, :points, :rebounds, :assists, :field_goal
  
  @@all = []
  
  def initialize(name = nil, position = nil, url = nil)
    @name = name
    @position = position
    @url = url
    @@all << all
  end 
  
  def self.all
    @@all
  end
  
  def self.new_player(player)
    self.new(
      player.search("span.CellPlayerName--long a").text, #creates player name
      player.search("td:nth-child(3)").text.split(" ").join(" "), #creates player position
      "https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/#{player.search("span.CellPlayerName--long a").attribute('href').text}" #creates player url
      )
  end
  
  def page
    @page ||= Nokoguri::HTML(open(self.url))
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

end