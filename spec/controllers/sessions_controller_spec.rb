require 'spec_helper'

describe SessionsController, :type => :controller do

  let(:valid_attributes) { { license: "9090", password: "secret" } }
  let(:valid_session) {}

  before :each do
    @doctor = FactoryGirl.build(:doctor, license: "9090", password: "secret")
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Session" do
        post :create, valid_attributes, valid_session
        assigns(session[:user_id]).should == @doctor.id
      end

      it "redirects to the root url" do
        post :create, valid_attributes, valid_session
        response.should redirect_to(root_url)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        post :create, { "license" => "0", password: "invalid" }, valid_session
        response.should render_template("new")
      end
    end
  end


end
