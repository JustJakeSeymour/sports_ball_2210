class Team

  attr_reader :team_name, 
              :location, 
              :roster,
              :details
  
  def initialize(team_name, location)
    @team_name = team_name
    @location = location
    @roster = []
    @details = {
      "total_value" => 0,
      "player_count" => 0
    }
  end
  
  def player_count
    @details["player_count"] = @roster.size
  end

  def add_player(player)
    @roster.push(player)
  end

  def long_term_players
    @roster.select do |player|
      player.contract_length > 24
    end
  end

  def short_term_players
    @roster.select do |player|
      player.contract_length <= 24
    end
  end

  def total_value
    total_value = 0
    @roster.each do |player|
      total_value += player.total_cost
    end
    @details["total_value"] = total_value
  end

  def average_cost_of_player
    average_cost = (total_value / player_count).to_s
    average_cost.gsub!(/\B(?=(...)*\b)/, ',')
    "$#{average_cost}"
  end
end