require 'spec_helper'

describe "case_logs/index" do
  let(:doctor) { Doctor.create({ "license" => "LICENSE", "email" => "doc@g.com", password: "secret", password_confirmation: "secret", state: "RN", name: "Robert" }) }

  before(:each) do
    assign(:case_logs, [
      CaseLog.create({
        :patient_name => "Patient Name",
        :patient_gender => 1,
        :description => "Description",
        :diagnosis => "Diagnosis",
        :treatment => "Treatment",
        :title => "Title",
        :doctor_id => doctor.id
      }),
      CaseLog.create({
        :patient_name => "Patient Name",
        :patient_gender => 1,
        :description => "Description",
        :diagnosis => "Diagnosis",
        :treatment => "Treatment",
        :title => "Title",
        :doctor_id => doctor.id
      })
    ])
  end

  it "renders a list of case_logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Patient Name".to_s, :count => 2
    assert_select "tr>td", :text => doctor.name.to_s, :count => 2
  end
end
