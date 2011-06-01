require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do

    describe "for signed in users" do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = Factory.create(:user)
        sign_in @user
      end

      it "should be succesful" do
        get :show, :id => @user
        response.should be_success
      end

    end
  end

end