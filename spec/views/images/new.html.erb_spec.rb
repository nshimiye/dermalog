require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :url => "MyString",
      :title => "MyString",
      :description => "MyString",
      :case_log_id => "MyString"
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", images_path, "post" do
      assert_select "input#image_url[name=?]", "image[url]"
      assert_select "input#image_title[name=?]", "image[title]"
      assert_select "input#image_description[name=?]", "image[description]"
      assert_select "input#image_case_log_id[name=?]", "image[case_log_id]"
    end
  end
end
