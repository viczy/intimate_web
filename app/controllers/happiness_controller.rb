class HappinessController < ApplicationController

	def new
		
	end

	def index
		@users = Happy.paginate(page: params[:page])
	end

	def create
		
	end

	def destroy
		
	end

end
