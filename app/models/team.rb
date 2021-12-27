class Team < ApplicationRecord
	belongs_to :rider
	belongs_to :club
end
