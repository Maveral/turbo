class Rider < ApplicationRecord

	after_create_commit { broadcast_prepend_to 'riders'}
	after_update_commit { broadcast_replace_to 'riders' }
	after_destroy_commit { broadcast_remove_to 'riders' }

	validates :name, :surename, presence: true

	has_many :teams
	has_many :clubs, through: :teams
	has_many :mechanics
end
