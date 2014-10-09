module RPS

	class Game < ActiveRecord::Base
  	belongs_to :player_1  class =Player
  	belongs_to :player_2
  	belongs_to :tournaments
	end

end


# create a join table named GamePlayers
# it'll have two columns: game_id and player_id

# has_many :game_players
# has_many :players, through: :game_players