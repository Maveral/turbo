class Club < ApplicationRecord
	has_many :teams
	has_many :riders, through: :teams
end
