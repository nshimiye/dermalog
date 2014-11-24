require 'spec_helper'

describe "Doctors", :type => :request do
  before :each do
    @user = FactoryGirl.build(:doctor, admin: true)
    DoctorsController.any_instance.stub(:current_user).and_return @user
  end

  describe "GET /doctors" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get doctors_path
      response.status.should be(200)
    end
  end
end
