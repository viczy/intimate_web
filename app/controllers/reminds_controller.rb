class RemindsController < ApplicationController

  def index
  	@reminds = Remind.all.page(params[:page]) 
  end

  def new
  	@remind = Remind.new
  end

  def show
  	@remind = Remind.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render :json => { id: @remind.id, alarm: @remind.alarm, address: @remind.address, content: @remind.content }.to_json }
    end

  end

  def create
  	@remind = Remind.new(remind_params)
    respond_to do |format|
      format.html {
      	if @remind.save
          redirect_to reminds_path
        else
          render 'new'
        end
      }

      format.json { 
        if @remind.save
          render json: @remind, status: :created
        else
          render json: @remind.errors, status: :unprocessable_entity
        end
      }
    end
  end


  def destroy

  end


  private
	    def remind_params
	      params.require(:remind).permit(:alarm, :content)
	    end


end
