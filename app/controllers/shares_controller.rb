class SharesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index]
  
  def index
    @shares = Share.all
    
    respond_to do |format|
      format.html #index.html.erb
    end
  end

end
