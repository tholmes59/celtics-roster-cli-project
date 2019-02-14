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
  
  
end