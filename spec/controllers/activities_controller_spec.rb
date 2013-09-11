require 'spec_helper'

describe ActivitiesController do
  before do
    @user = FactoryGirl.create(:user) 
    sign_in @user
  end
  
  let(:valid_attributes) { { name: "Pushups", use_reps: true } }
  let(:valid_session) { {} }  

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, {:activity => valid_attributes}, valid_session
        }.to change(Activity, :count).by(1)
      end

      it "assigns a newly created Activity as @Activity" do
        post :create, {:activity => valid_attributes}, valid_session
        assigns(:activity).should be_a(Activity)
        assigns(:activity).should be_persisted
      end

      it "redirects to the created Activity" do
        post :create, {:activity => valid_attributes}, valid_session
        response.should redirect_to activity_path(@activity)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved Activity as @Activity" do
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        post :create, {:activity => { name: nil }}, valid_session
        assigns(:activity).should be_a_new(Activity)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        post :create, {:activity => { name: nil }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested Activity" do
        Activity = Activity.create! valid_attributes
        # Assuming there are no other Activitys in the database, this
        # specifies that the Activity created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Activity.any_instance.should_receive(:update).with({ "name" => "Pullups" })
        put :update, {:id => Activity.to_param, :activity => { name: "Pullups"}}, valid_session
      end

      it "assigns the requested Activity as @Activity" do
        Activity = Activity.create! valid_attributes
        put :update, {:id => Activity.to_param, :activity => valid_attributes}, valid_session
        assigns(:Activity).should eq(Activity)
      end

      it "redirects to the Activity" do
        Activity = Activity.create! valid_attributes
        put :update, {:id => Activity.to_param, :activity => valid_attributes}, valid_session
        response.should redirect_to user_Activity_path(@user, Activity)
      end
    end

    describe "with invalid params" do
      it "assigns the Activity as @Activity" do
        Activity = Activity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        put :update, {:id => Activity.to_param, :Activity => { user_id: "bad" }}, valid_session
        assigns(:activity).should eq(Activity)
      end

      it "re-renders the 'edit' template" do
        Activity = Activity.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Activity.any_instance.stub(:save).and_return(false)
        put :update, {:id => Activity.to_param, :Activity => { user_id: "bad" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested Activity" do
      Activity = Activity.create! valid_attributes
      expect {
        delete :destroy, {:id => Activity.to_param}, valid_session
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the Activitys list" do
      Activity = Activity.create! valid_attributes
      delete :destroy, {:id => Activity.to_param}, valid_session
      response.should redirect_to activitys_path(@activity)
    end
  end

end
