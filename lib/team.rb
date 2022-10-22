class Team

  attr_reader :team_name, :location, :roster
  
  def initialize(team_name, location)
    @team_name = team_name
    @location = location
    @roster = []
  end
  
  def player_count
    @roster.size
  end

  def add_player(player)
    @roster.push(player)
  end

end