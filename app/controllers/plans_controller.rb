class PlansController < ApplicationController
  def index
  end

  def new
  	@plan = Plan.new
  end

  def destroy
  end
end
