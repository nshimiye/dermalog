require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :url => "Url",
        :title => "Title",
        :description => "Description",
        :case_log_id => "Case Log"
      ),
      stub_model(Image,
        :url => "Url",
        :title => "Title",
        :description => "Description",
        :case_log_id => "Case Log"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Case Log".to_s, :count => 2
  end
end
