require 'spec_helper'

describe SessionsController, :type => :controller do

  let(:valid_attributes) { { license: "9090", password: "secret" } }

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
        # expect {
        # }.to change({}, :count).by(1)
        # current_user.should_return @doctor
        # post :create, {valid_attributes}, valid_session
      end

      it "redirects to the created case_log" do
        post :create, {:case_log => valid_attributes}, valid_session
        response.should redirect_to(root_url)
      end
    end

    # describe "with invalid params" do
    #   it "assigns a newly created but unsaved case_log as @case_log" do
    #     # Trigger the behavior that occurs when invalid params are submitted
    #     CaseLog.any_instance.stub(:save).and_return(false)
    #     post :create, {:case_log => { "patient_name" => "invalid value" }}, valid_session
    #     assigns(:case_log).should be_a_new(CaseLog)
    #   end

    #   it "re-renders the 'new' template" do
    #     # Trigger the behavior that occurs when invalid params are submitted
    #     CaseLog.any_instance.stub(:save).and_return(false)
    #     post :create, {:case_log => { "patient_name" => "invalid value" }}, valid_session
    #     response.should render_template("new")
    #   end
    # end
  end


end
