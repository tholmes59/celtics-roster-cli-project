class CelticsRosterCliProject::Player
  
  attr_accessor :name, :url, :body, :age, :hometown, :school, :experience, :points, :rebounds, :assists, :field_goal, :position
  
  @@all = []
  
  
 
  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    @@all << self
  end 
  
  def self.all
    @@all
  end
  
  
  

end