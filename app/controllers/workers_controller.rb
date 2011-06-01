class WorkersController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :create]
  def index
    @workers = current_user.workers
    
    respond_to do |format|
      format.html #index.html.erb
    end
  end

  def create
    @worker = current_user.workers.build(params[:worker])
    if @worker.save
      redirect_to current_user, :flash => {:success => "New worker created!"}
    else
      render "new"
    end
  end

end
