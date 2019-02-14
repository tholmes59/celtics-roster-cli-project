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
    self.new(player.search("span.CellPlayerName--long a").text), player.search("td:nth-child(3)").text.split(" ").join(" ")), "https://www.cbssports.com/nba/teams/BOS/boston-celtics/roster/#{player.search(")
  
end