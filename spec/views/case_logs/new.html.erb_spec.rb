require 'spec_helper'

describe "case_logs/new" do
  let(:doctor) { Doctor.create({ "license" => "LICENSE", "email" => "doc@g.com", password: "secret", password_confirmation: "secret", state: "RN", name: "Robert" }) }
  before(:each) do
    assign(:case_log, CaseLog.new({
      :patient_name => "MyString",
      :patient_gender => 1,
      :description => "MyString",
      :diagnosis => "MyString",
      :treatment => "MyString",
      :title => "MyString",
      :doctor_id => doctor.id
    }))
  end

  it "renders new case_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", case_logs_path, "post" do
      assert_select "input#case_log_patient_name[name=?]", "case_log[patient_name]"
      assert_select "input#case_log_patient_gender_1[name=?]", "case_log[patient_gender]"
      assert_select "input#case_log_patient_gender_2[name=?]", "case_log[patient_gender]"
      assert_select "textarea#case_log_description[name=?]", "case_log[description]"
      assert_select "textarea#case_log_diagnosis[name=?]", "case_log[diagnosis]"
      assert_select "textarea#case_log_treatment[name=?]", "case_log[treatment]"
      assert_select "input#case_log_title[name=?]", "case_log[title]"
    end
  end
end
