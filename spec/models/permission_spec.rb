# require "spec_helper"

# RSpec::Matchers.define :grant_permission do |*args|
#   match do |permission|
#     expect(permission.allow?(*args)).to be_true
#   end
# end

# describe Permission do
#   describe "as guest" do
#     subject { Permission.new(nil) }
    
#     it { should grant_permission("dermalog", "anything") }
#     it { should grant_permission("sessions", "anything") }
#     it { should grant_permission("doctors", "new") }
#     it { should grant_permission("doctors", "create") }

#     it { should_not grant_permission("doctors", "delete") }
#     it { should_not grant_permission("doctors", "update") }
#     it { should_not grant_permission("doctors", "edit") }
#   end
  
#   describe "as admin" do
#     subject { Permission.new(FactoryGirl.build(:doctor, admin: true)) }
    
#     it { should grant_permission("anything", "here") }
#   end
  
#   describe "as member" do
#     subject { Permission.new(FactoryGirl.build(:doctor, admin: false)) }
    
#     it { should grant_permission("case_logs", "index") }
#     it { should grant_permission("case_logs", "new") }

#   end
# end