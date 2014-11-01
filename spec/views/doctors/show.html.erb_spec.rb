require 'spec_helper'

describe "doctors/show" do
  before(:each) do
    @doctor = assign(:doctor, stub_model(Doctor,
      :license => "License",
      :name => "Name",
      :email => "Email",
      :password => "Password",
      :state => "State",
      :admin => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/License/)
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Password/)
    rendered.should match(/State/)
    rendered.should match(/false/)
  end
end
