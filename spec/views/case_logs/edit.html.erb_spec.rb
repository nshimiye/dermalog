require 'spec_helper'

describe "case_logs/edit" do

  # create a doctor
  let(:doctor) { Doctor.create({ "license" => "LICENSE", "email" => "doc@g.com", password: "secret", password_confirmation: "secret", state: "RN", name: "Robert" }) }
  # use the doctor to create a case
  before(:each) do
    @case_log = assign(:case_log, CaseLog.create({
      :patient_name => "MyString",
      :patient_gender => 1,
      :description => "MyString",
      :diagnosis => "MyString",
      :treatment => "MyString",
      :title => "MyString",
      :doctor_id => doctor.id
    }))
  end

  it "renders the edit case_log form" do
    render

      # Run the generator again with the --webrat flag if you want to use webrat matchers
      assert_select "form[action=?][method=?]", case_log_path(@case_log), "post" do
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
