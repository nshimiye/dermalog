require 'spec_helper'

describe "case_logs/show.html.erb" do
  let(:doctor) { Doctor.create({ "license" => "LICENSE", "email" => "doc@g.com", password: "secret", password_confirmation: "secret", state: "RN", name: "Robert" }) }
  before(:each) do
    @case_log = assign(:case_log, CaseLog.create({
      :patient_name => "Patient Name",
      :patient_gender => 1,
      :description => "Description",
      :diagnosis => "Diagnosis",
      :treatment => "Treatment",
      :title => "Title",
      :doctor_id => doctor
    }))
    assign(:images, [])
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
