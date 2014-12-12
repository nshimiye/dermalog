require 'rails_helper'

RSpec.describe "shares/index", :type => :view do
  before(:each) do
    assign(:shares, [
      Share.create!(
        :case_log_id => "Case Log",
        :doctor_id => "Doctor"
      ),
      Share.create!(
        :case_log_id => "Case Log",
        :doctor_id => "Doctor"
      )
    ])
  end

  it "renders a list of shares" do
    render
    assert_select "tr>td", :text => "Case Log".to_s, :count => 2
    assert_select "tr>td", :text => "Doctor".to_s, :count => 2
  end
end
