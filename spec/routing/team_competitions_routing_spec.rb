require "spec_helper"

describe TeamCompetitionsController do
  describe "routing" do

    it "routes to #index" do
      get("/team_competitions").should route_to("team_competitions#index")
    end

    it "routes to #new" do
      get("/team_competitions/new").should route_to("team_competitions#new")
    end

    it "routes to #show" do
      get("/team_competitions/1").should route_to("team_competitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/team_competitions/1/edit").should route_to("team_competitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/team_competitions").should route_to("team_competitions#create")
    end

    it "routes to #update" do
      put("/team_competitions/1").should route_to("team_competitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/team_competitions/1").should route_to("team_competitions#destroy", :id => "1")
    end

  end
end
