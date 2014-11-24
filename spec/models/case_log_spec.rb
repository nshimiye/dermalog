require 'spec_helper'

describe CaseLog do
  let(:valid_attributes) { { "patient_name" => "someone", "title" => "some title" } }

  it "can be instanciated" do
  	CaseLog.new(valid_attributes).should be_an_instance_of(CaseLog)
  end

  it "can be saved" do
  	CaseLog.create(valid_attributes).should be_persisted
  end

end
