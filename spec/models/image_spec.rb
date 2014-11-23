require 'spec_helper'

describe Image do
  it "can be instanciated" do
  	Image.new.should be_an_instance_of(Image)
  end

  it "can be saved" do
  	Image.create.should be_persisted
  end

end
