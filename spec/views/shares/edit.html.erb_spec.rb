require 'rails_helper'

RSpec.describe "shares/edit", :type => :view do
  before(:each) do
    @share = assign(:share, Share.create!(
      :case_log_id => "MyString",
      :doctor_id => "MyString"
    ))
  end

  it "renders the edit share form" do
    render

    assert_select "form[action=?][method=?]", share_path(@share), "post" do

      assert_select "input#share_case_log_id[name=?]", "share[case_log_id]"

      assert_select "input#share_doctor_id[name=?]", "share[doctor_id]"
    end
  end
end
