class FeedbacksController < ApplicationController

	def new 
  		@feedback = Feedback.new
  	end

  	def index
  	end

  	def show
  		@feedback = Feedback.find(params[:id]) 
  	end

  	def create
    	@feedback = Feedback.new(feedback_params)
    	respond_to do |format|
		    format.html {
		        if @user.save

		        else
		          render 'new'
		        end
		    }

	      	format.json { 
	        	if @user.save
	        		render json: @user, status: :created
	        	else
	          		render json: @user.errors, status: :unprocessable_entity
	        	end
	      	}
    	end
  	end



  private

    def feedback_params
      	params.require(:feedback).permit(:title, :content, :email)
    end

end
