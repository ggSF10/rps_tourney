module RPS

	class Player < ActiveRecord::Base
  	has_many :tournaments
	end

end