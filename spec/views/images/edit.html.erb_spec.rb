require 'spec_helper'

describe "images/edit" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :url => "MyString",
      :title => "MyString",
      :description => "MyString",
      :case_log_id => "MyString"
    ))
  end

  it "renders the edit image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", image_path(@image), "post" do
      assert_select "input#image_url[name=?]", "image[url]"
      assert_select "input#image_title[name=?]", "image[title]"
      assert_select "input#image_description[name=?]", "image[description]"
      assert_select "input#image_case_log_id[name=?]", "image[case_log_id]"
    end
  end
end
