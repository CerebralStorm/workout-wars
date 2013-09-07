require "spec_helper"

describe UsersController do
  describe "routing" do
    before do
      @user = FactoryGirl.create(:user) 
    end

    it "routes to #index" do
      get("/users").should route_to(controller: "users", action: "index")
    end

    it "routes to #show" do
      get("/users/1").should route_to(controller: "users", action: "show", id: "1")
    end

    it "routes to #edit" do
      get("/users/1/edit").should route_to(controller: "users", action: "edit", id: "1")
    end

    it "routes to #create" do
      post("/users").should route_to(controller: "devise/registrations", action: "create")
    end

    it "routes to #update" do
      put("/users/1").should route_to(controller: "users", action: "update", id: "1")
    end

    it "routes to #destroy" do
      delete("/users/1").should route_to(controller: "users", action: "destroy", id: "1")
    end

  end
end
