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

  it 'has a different player count when players added' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous", 1000000, 36)
    player_2 = Player.new("Kenny Denunez", 500000, 24)

    team.add_player(player_1)
    team.add_player(player_2)

    expect(team.player_count).to eq 2
  end

  it 'knows long term player contracts' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous", 1000000, 36)
    player_2 = Player.new("Kenny Denunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
    
    expect(team.long_term_players).to eq [player_1, player_3]
  end

  it 'knows short term player contracts' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous", 1000000, 36)
    player_2 = Player.new("Kenny Denunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.short_term_players).to eq [player_2, player_4]
  end

  it 'can calculate total value' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous", 1000000, 36)
    player_2 = Player.new("Kenny Denunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)

    expect(team.total_value).to eq 85200000
  end

  it 'gives has a details hash with total value and player count' do
    team = Team.new("Dodgers", "Los Angeles")
    player_1 = Player.new("Michael Palledorous", 1000000, 36)
    player_2 = Player.new("Kenny Denunez", 500000, 24)
    player_3 = Player.new("Alan McClennan", 750000, 48)
    player_4 = Player.new("Hamilton Porter", 100000, 12)

    team.add_player(player_1)
    team.add_player(player_2)
    team.add_player(player_3)
    team.add_player(player_4)
    
    team.total_value
    team.player_count

    expect(team.details["total_value"]).to eq 85200000
    expect(team.details["player_count"]).to eq 4
  end
end