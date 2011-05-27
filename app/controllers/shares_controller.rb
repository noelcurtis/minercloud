class SharesController < ApplicationController
  
  def index
    @shares = Share.all
    
    respond_to do |format|
      format.html #index.html.erb
    end
  end

end
