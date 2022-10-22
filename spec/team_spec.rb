require 'rspec'
require './lib/player'
require './lib/team'
require 'pry'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team).to be_a Team
  end

  it 'has a team name' do
    team = Team.new("Dodgers", "Los Angeles")
    
    expect(team.team_name).to eq ("Dodgers")
  end

   it 'has a location' do
    team = Team.new("Dodgers", "Los Angeles")
    
    expect(team.location).to eq ("Los Angeles")
  end
  
  it 'starts with an empty roster' do
    team = Team.new("Dodgers", "Los Angeles")
    
    expect(team.roster).to eq []
  end

  it 'counts players in roster' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.player_count).to eq 0
  end

  it 'can add players to roster' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous", 1000000, 36)
    player_2 = Player.new("Kenny Denunez", 500000, 24)

    team.add_player(player_1)
    team.add_player(player_2)

    expect(team.roster).to eq [player_1, player_2]
  end

end