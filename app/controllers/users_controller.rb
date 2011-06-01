class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]

  def show
    @user = current_user
    @workers = current_user.workers

    respond_to do |format|
      format.html #index.html.erb
    end
  end
end