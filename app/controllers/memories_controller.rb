class MemoriesController < ApplicationController
  def index
  end

  def new
  	@memory = Memory.new
  end

  def destroy
  end
end
