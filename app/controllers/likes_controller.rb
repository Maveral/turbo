class LikesController < ApplicationController
	before_action :set_rider


	def create
		a = @rider.likes_count + 1
		@rider.update(likes_count: a)
		redirect_to @rider
	end

	private

	def set_rider
		@rider = Rider.find(params[:rider_id])
	end
end