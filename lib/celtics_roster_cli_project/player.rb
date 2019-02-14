class CelticsRoster::Player
  
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
      player.search("span.CellPlayerName--long a").text), #creates player name
      player.search("td:nth-child(3)").text.split(" ").join(" ")), #creates player position
      "https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/#{player.search("span.CellPlayerName--long a").attribute('href').text}" #creates player url
      )
  end
  
  def page
    @page ||= Nokoguri::HTML(open(self.url))
  end 
  
  def body
    @body ||= page.css("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(2)").text
  end 
  
  def age
    @age ||= page.css("div.featureComponent.stdPad.mBottom10 dl dd:nth-child(6)").text
  end 
  
  def hometown
    
  end
  
  def school
    
  end
  
  def experience
    
  end
  
  def points
    
  end
  
  def rebounds
    
  end
  
  def assists
    
  end
  
  def field_goal
    
  end
  
end