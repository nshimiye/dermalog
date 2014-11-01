require 'spec_helper'

describe "case_logs/index" do
  before(:each) do
    assign(:case_logs, [
      stub_model(CaseLog,
        :patient_name => "Patient Name",
        :patient_gender => 1,
        :description => "Description",
        :diagnosis => "Diagnosis",
        :treatment => "Treatment",
        :title => "Title",
        :doctor_id => "Doctor"
      ),
      stub_model(CaseLog,
        :patient_name => "Patient Name",
        :patient_gender => 1,
        :description => "Description",
        :diagnosis => "Diagnosis",
        :treatment => "Treatment",
        :title => "Title",
        :doctor_id => "Doctor"
      )
    ])
  end

  it "renders a list of case_logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Patient Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Diagnosis".to_s, :count => 2
    assert_select "tr>td", :text => "Treatment".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Doctor".to_s, :count => 2
  end
end
