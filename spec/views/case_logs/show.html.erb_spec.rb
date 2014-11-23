require 'spec_helper'

describe "case_logs/show.html.erb" do
  before(:each) do
    @case_log = assign(:case_log, stub_model(CaseLog,
      :patient_name => "Patient Name",
      :patient_gender => 1,
      :description => "Description",
      :diagnosis => "Diagnosis",
      :treatment => "Treatment",
      :title => "Title",
      :doctor_id => "Doctor"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Patient Name/)
    rendered.should match(/1/)
    rendered.should match(/Description/)
    rendered.should match(/Diagnosis/)
    rendered.should match(/Treatment/)
    rendered.should match(/Title/)
    rendered.should match(/Doctor/)
  end
end
