require 'spec_helper'

describe "doctors/index" do
  before(:each) do
    assign(:doctors, [
      stub_model(Doctor,
        :license => "License",
        :name => "Name",
        :email => "Email",
        :password => "Password",
        :state => "State",
        :admin => false
      ),
      stub_model(Doctor,
        :license => "License",
        :name => "Name",
        :email => "Email",
        :password => "Password",
        :state => "State",
        :admin => false
      )
    ])
  end

  it "renders a list of doctors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "License".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
