class PlansController < ApplicationController
  def index
  	@plans = Plan.all.page(params[:page]) 
  	# @plans = Plan.all.page({page: @page, per_page: 20}) 
  end

  def new
  	@plan = Plan.new
  end

  def show
    @plan = Plan.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render :json => { id: @plan.id, title: @plan.title, detail: @plan.detail, createtime: @plan.created_at }.to_json }
    end
  end

  def create
  	@plan = Plan.new(plan_params)
    respond_to do |format|
      format.html {
        if @plan.save
          flash[:success] = "Welcome to the INTIMATE!"
          redirect_to plans_path
        else
          render 'new'
        end
      }

      format.json { 
        if @plan.save
          render json: @plan, status: :created
        else
          render json: @plan.errors, status: :unprocessable_entity
        end
      }
    end

  end
    
  def destroy

  end



	private
	    def plan_params
	      params.require(:plan).permit(:title, :detail)
	    end

end



