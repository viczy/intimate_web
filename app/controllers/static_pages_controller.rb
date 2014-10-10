class StaticPagesController < ApplicationController

  def home
  	render :layout => false
  end

  def about
  end

  def calendar
  	render :layout => false
  end

end
