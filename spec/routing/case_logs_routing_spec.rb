require "spec_helper"

describe CaseLogsController do
  describe "routing" do

    it "routes to #index" do
      get("/case_logs").should route_to("case_logs#index")
    end

    it "routes to #new" do
      get("/case_logs/new").should route_to("case_logs#new")
    end

    it "routes to #show" do
      get("/case_logs/1").should route_to("case_logs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/case_logs/1/edit").should route_to("case_logs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/case_logs").should route_to("case_logs#create")
    end

    it "routes to #update" do
      put("/case_logs/1").should route_to("case_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/case_logs/1").should route_to("case_logs#destroy", :id => "1")
    end

  end
end
