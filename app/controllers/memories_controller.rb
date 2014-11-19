class MemoriesController < ApplicationController
  def index
  	@memories = Memory.all.page(params[:page]) 
  end

  def new
  	@memory = Memory.new
  end

  def show
    @memory = Memory.find(params[:id])
    respond_to do |format|
      format.html 
      format.json { render :json => { id: @memory.id, memorydate: @memory.memorydate, content: @memory.content }.to_json }
    end
  end

  def create
  	@memory = Memory.new(memory_params)
    respond_to do |format|
      format.html {
        if @memory.save
          redirect_to memories_path
        else
          render 'new'
        end
      }

      format.json { 
        if @memory.save
          render json: @memory, status: :created
        else
          render json: @memory.errors, status: :unprocessable_entity
        end
      }
    end
  end

  def destroy

  end

  private
	    def memory_params
	      params.require(:memory).permit(:memorydate, :content)
	    end

end
