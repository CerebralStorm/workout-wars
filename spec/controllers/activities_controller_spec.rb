require 'spec_helper'

describe ActivitiesController do
  # before do
  #   @user = FactoryGirl.create(:user) 
  #   sign_in @user
  # end

  # let(:valid_attributes) { { date: Date.today, user_id: @user.id } }
  # let(:valid_session) { {} }  

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Workout" do
  #       expect {
  #         post :create, {user_id: @user.id, :workout => valid_attributes}, valid_session
  #       }.to change(Workout, :count).by(1)
  #     end

  #     it "assigns a newly created workout as @workout" do
  #       post :create, {user_id: @user.id, :workout => valid_attributes}, valid_session
  #       assigns(:workout).should be_a(Workout)
  #       assigns(:workout).should be_persisted
  #     end

  #     it "redirects to the created workout" do
  #       post :create, {user_id: @user.id, :workout => valid_attributes}, valid_session
  #       response.should redirect_to user_workouts_path(@user)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved workout as @workout" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Workout.any_instance.stub(:save).and_return(false)
  #       post :create, {user_id: @user.id, :workout => { user_id: "bad" }}, valid_session
  #       assigns(:workout).should be_a_new(Workout)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Workout.any_instance.stub(:save).and_return(false)
  #       post :create, {user_id: @user.id, :workout => { user_id: "bad" }}, valid_session
  #       response.should render_template("new")
  #     end
  #   end
  # end

  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested workout" do
  #       workout = Workout.create! valid_attributes
  #       # Assuming there are no other workouts in the database, this
  #       # specifies that the Workout created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       Workout.any_instance.should_receive(:update).with({ "date" => "1984-08-29" })
  #       put :update, {user_id: @user.id, :id => workout.to_param, :workout => { :date => Date.strptime('08/29/1984', '%m/%d/%Y') }}, valid_session
  #     end

  #     it "assigns the requested workout as @workout" do
  #       workout = Workout.create! valid_attributes
  #       put :update, {user_id: @user.id, :id => workout.to_param, :workout => valid_attributes}, valid_session
  #       assigns(:workout).should eq(workout)
  #     end

  #     it "redirects to the workout" do
  #       workout = Workout.create! valid_attributes
  #       put :update, {user_id: @user.id, :id => workout.to_param, :workout => valid_attributes}, valid_session
  #       response.should redirect_to user_workout_path(@user, workout)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns the workout as @workout" do
  #       workout = Workout.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Workout.any_instance.stub(:save).and_return(false)
  #       put :update, {user_id: @user.id, :id => workout.to_param, :workout => { user_id: "bad" }}, valid_session
  #       assigns(:workout).should eq(workout)
  #     end

  #     it "re-renders the 'edit' template" do
  #       workout = Workout.create! valid_attributes
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       Workout.any_instance.stub(:save).and_return(false)
  #       put :update, {user_id: @user.id, :id => workout.to_param, :workout => { user_id: "bad" }}, valid_session
  #       response.should render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested workout" do
  #     workout = Workout.create! valid_attributes
  #     expect {
  #       delete :destroy, {user_id: @user.id, :id => workout.to_param}, valid_session
  #     }.to change(Workout, :count).by(-1)
  #   end

  #   it "redirects to the workouts list" do
  #     workout = Workout.create! valid_attributes
  #     delete :destroy, {user_id: @user.id, :id => workout.to_param}, valid_session
  #     response.should redirect_to user_workouts_path(@user)
  #   end
  # end

end
