def game_hash
 game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],  
    :players => {
      "Alan Anderson" => {
        :number => 0,  
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1 
      }, 
      "Reggie Evans" => {
        :number => 30,  
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7 
      }, 
      "Brook Lopez" => {
        :number => 11,  
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15 
      }, 
      "Mason Plumlee" => {
        :number => 1,  
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5 
      }, 
      "Jason Terry" => {
        :number => 31,  
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  
  :away => {
    :team_name => "Charlotte Hornets",
    :colors  => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4, 
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2 
      },
      "Bismack Biyombo" => {
        :number => 0, 
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10 
      },
      "DeSagna Diop" => {
        :number => 2, 
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5 
      },
      "Ben Gordon" => {
        :number => 8, 
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Kemba Walker" => {
        :number => 33, 
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12 
      }
    }
  }
  }
end

def num_points_scored(name) 
  hash = game_hash
  game_hash.each do |teams_playing, data| 
    data[:players].each do |player_name, player_data|
      if  player_name == name
        return hash[teams_playing][:players][name][:points]
      end 
    end 
  end 
end

def shoe_size(name) 
  hash = game_hash
  game_hash.each do |teams_playing, data| 
    data[:players].each do |player_name, player_data|
      if  player_name == name
        return hash[teams_playing][:players][name][:shoe]
      end 
    end 
  end 
end

def team_colors(team_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == team_name
      return keys[:colors].map(&:capitalize)
    end
  end
end

def team_names
  game_hash.map {|home_away, keys| keys[:team_name]}
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            jersey_numbers << stats[:number]
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name) 
  hash = game_hash
  hash.each do |teams_playing, data|
    data[:players].each do |player_name, player_data|
      if player_name == name
        return hash[teams_playing][:players][name]
      end 
    end 
  end 
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0

  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:shoe] > biggest_shoe
           biggest_shoe = stats[:shoe]
           num_rebounds = stats[:rebounds]
          end
        end
      end
    end
  end
  num_rebounds
end

def most_points_scored
  most_points = 0
  most_points_scored = "player"
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] > most_points
            most_points = stats[:points]
            most_points_scored = player
          end
        end
      end
    end
  end
  most_points_scored
end

def winning_team
  home_team_points_total = 0
  away_team_points_total = 0
  game_hash.each do |location, team|
    if location == :home
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            home_team_points_total += stats[:points]
          end
        end
      end
    else
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            away_team_points_total += stats[:points]
          end
        end
      end
    end
  end
  if home_team_points_total > away_team_points_total
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_length = 0
  player_with_longest_name = "player"
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player.length > longest_name_length
            longest_name_length = player.length
            player_with_longest_name = player
          end
        end
      end
    end
  end
  player_with_longest_name
end

def long_name_steals_a_ton?
  best_steals = 0
  player_with_best_steals = "player"
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:steals] > best_steals
            best_steals = stats[:steals]
            player_with_best_steals = player
          end
        end
      end
    end
  end
  if player_with_best_steals == player_with_longest_name
    return true
  end
end
