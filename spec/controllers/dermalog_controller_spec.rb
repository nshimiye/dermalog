require 'spec_helper'

describe DermalogController, :type => :controller do

  describe "GET 'index'" do
    it "If logged in, root should redirect to user page" do
      @user = FactoryGirl.build(:doctor)
	  DermalogController.any_instance.stub(:current_user).and_return @user
      get 'index'
      response.should redirect_to(@user)
    end

    it "If logged out, root should redirect to login page" do
	  DermalogController.any_instance.stub(:current_user).and_return nil
      get 'index'
      response.should redirect_to(login_path)
    end
  end

  describe "GET 'forgot_password'" do
    it "returns http success" do
      get 'forgot_password'
      response.should be_success
    end
  end

  # describe "POST 'retrieve_password'" do
  	
  # end

end
