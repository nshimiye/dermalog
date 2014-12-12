require 'rails_helper'

RSpec.describe "shares/show", :type => :view do
  before(:each) do
    @share = assign(:share, Share.create!(
      :case_log_id => "Case Log",
      :doctor_id => "Doctor"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Case Log/)
    expect(rendered).to match(/Doctor/)
  end
end
