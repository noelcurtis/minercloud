class WorkersController < ApplicationController
  
  def index
    @workers = Worker.all
    
    respond_to do |format|
      format.html #index.html.erb
    end
  end

end
