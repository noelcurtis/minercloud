class UsersController < ApplicationController
  before_filter :authenticate_user!, :only => [:show]
  before_filter :correct_user, :only => [:show]

  def show
    @user = current_user
    @workers = current_user.workers

    respond_to do |format|
      format.html #index.html.erb
    end
  end

  private

    def correct_user                 #will make sure the signed_in user is the one trying to access his own page and not elses
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end

    def current_user?(user)
      user == current_user
    end

end