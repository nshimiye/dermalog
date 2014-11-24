require 'spec_helper'

describe Doctor do

  let(:valid_attributes) { { "license" => "MyString", "email" => "doc@g.com", password: "secret", password_confirmation: "secret", state: "RN", name: "Robert" } }

  it "can be instanciated" do
  	Doctor.new(valid_attributes).should be_an_instance_of(Doctor)
  end

  it "can be saved" do
  	Doctor.create(valid_attributes).should be_persisted
  end

end
