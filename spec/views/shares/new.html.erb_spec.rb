require 'rails_helper'

RSpec.describe "shares/new", :type => :view do
  before(:each) do
    assign(:share, Share.new(
      :case_log_id => "MyString",
      :doctor_id => "MyString"
    ))
  end

  it "renders new share form" do
    render

    assert_select "form[action=?][method=?]", shares_path, "post" do

      assert_select "input#share_case_log_id[name=?]", "share[case_log_id]"

      assert_select "input#share_doctor_id[name=?]", "share[doctor_id]"
    end
  end
end
