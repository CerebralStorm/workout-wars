require "spec_helper"

describe WorkoutsController do
  describe "routing" do
    before do
      @user = FactoryGirl.create(:user) 
    end

    let(:user_path) { "/users/#{@user.id}"}

    it "routes to #index" do
      get("#{user_path}/workouts").should route_to(controller: "workouts", action: "index", user_id: "#{@user.id}")
    end

    it "routes to #new" do
      get("#{user_path}/workouts/new").should route_to(controller: "workouts", action: "new", user_id: "#{@user.id}")
    end

    it "routes to #show" do
      get("#{user_path}/workouts/1").should route_to(controller: "workouts", action: "show", user_id: "#{@user.id}", id: "1")
    end

    it "routes to #edit" do
      get("#{user_path}/workouts/1/edit").should route_to(controller: "workouts", action: "edit", user_id: "#{@user.id}", id: "1")
    end

    it "routes to #create" do
      post("#{user_path}/workouts").should route_to(controller: "workouts", action: "create", user_id: "#{@user.id}")
    end

    it "routes to #update" do
      put("#{user_path}/workouts/1").should route_to(controller: "workouts", action: "update", user_id: "#{@user.id}", id: "1")
    end

    it "routes to #destroy" do
      delete("#{user_path}/workouts/1").should route_to(controller: "workouts", action: "destroy", user_id: "#{@user.id}", id: "1")
    end

  end
end
