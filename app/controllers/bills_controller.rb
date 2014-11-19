class BillsController < ApplicationController

  def index
  	@bills = Bill.all.page(params[:page]) 
  end

  def new
  	@bill = Bill.new
  end

  def show
  	@bill = Bill.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render :json => { id: @bill.id, createtime: @bill.createtime, sepnd: @bill.spend, detail: @bill.detail }.to_json }
    end

  end

  def create
  	@bill = Bill.new(bill_params)
    respond_to do |format|
      format.html {
      	if @bill.save
          redirect_to bills_path
        else
          render 'new'
        end
      }

      format.json { 
        if @bill.save
          render json: @bill, status: :created
        else
          render json: @bill.errors, status: :unprocessable_entity
        end
      }
    end

  end

  def destroy

  end


  private
	    def bill_params
	      params.require(:bill).permit(:createtime, :spend, :detail)
	    end

end
