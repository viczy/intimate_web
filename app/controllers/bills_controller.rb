class BillsController < ApplicationController
  def index
  end

  def new
  	@bill = Bill.new
  end

  def destroy
  end
end
