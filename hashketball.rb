# Write your code here!
require 'pry'

def game_hash
  {
    home:  {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        { player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      ]
    },


    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        { player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        { player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        { player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        { player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        },
      ]
    }
  }
end

#takes in a name of a selected_player
#iterate down to player stats
#conditional: return player's :points value if == the selected_player
def num_points_scored(player_name)
  game_hash.values.each do |roster|
    roster[:players].each do |player|
      return player[:points] if player.has_value?(player_name)
    end
  end
end


#takes in a name of a selected_player
#iterate down to player stats
#conditional: return player's :shoe value if == the selected_player
def shoe_size(player_name)
  game_hash.values.each do |team|
    team[:players].each do |player|
      return player[:shoe] if player.has_value?(player_name)
    end
  end
end


def team_colors(selected_team)
  game_hash.values.each do |team|
      if team[:team_name] == selected_team
        return team[:colors]
      end
    end
end

# def team_names
#   game_hash.values.each do |teams|
#     return teams[:team_name]
#   end
# end

def team_names
 game_hash.values.map {|teams| teams[:team_name]}
end

# def player_numbers(selected_team)
#   game_hash.values.each do |team|
#     if team.has_value?(selected_team)
#       team[:players].each do |roster|
#         return roster[:number]
#       end
#     end
#   end
# end


#takes in a selected_team
#iterate down to player's stats
#conditional: return :number value if == selected_team
def player_numbers(selected_team)
  game_hash.values.each do |team|
      if team.has_value?(selected_team)
        return team[:players].map {|jerseys| jerseys[:number]}
    end
  end
end

#failed tests, tried to use .except
# def player_stats(selected_player)
#   game_hash.values.each do |roster|
#     roster[:players].each do |player|
#        if player.has_value?(selected_player)
#       # ???????????
#         return player.except(:player_name)
#       end
#     end
#   end
# end

#iterate down to player stats
#conditional: if :player_name == selected_player
#remove player-name from values
#return corresponding values
def player_stats(selected_player)
  game_hash.values.each do |roster|
    roster[:players].each do |player|
       if player.has_value?(selected_player)
        player.delete(:player_name)
        return player
      end
    end
  end
end


#iterate down to player stats
#conditional to find biggest :shoe values
#return :rebound value associated with player with the largest shoe size
def big_shoe_rebounds
  big_foot = 0
  boards = 0

  game_hash.values.each do |roster|
    roster[:players].each do |player|
      if player[:shoe] > big_foot
        big_foot = player[:shoe]
        boards = player[:rebounds]
      end
    end
  end
  return boards
end

#iterate down to all player stats
#conditional to compare :points value
#return :player_name value associated with highest :points value
def most_points_scored
   most_points = 0
   leading_scorer = ""

  game_hash.values.each do |roster|
    roster[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        leading_scorer = player[:player_name]
      end
    end
  end
  return leading_scorer
end
