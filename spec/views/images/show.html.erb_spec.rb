require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :url => "Url",
      :title => "Title",
      :description => "Description",
      :case_log_id => "Case Log"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Case Log/)
  end
end
