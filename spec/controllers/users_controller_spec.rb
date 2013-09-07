require 'spec_helper'

describe UsersController do
  before do
    @user = FactoryGirl.create(:user) 
    sign_in @user
  end

  let(:valid_attributes) { { name: "Egon Spengler", email: "egon1@bustinghosts.com",
                             password: "do3rayEgon", password_confirmation: "do3rayEgon" } }
  let(:valid_session) { {} } 

  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}, valid_session
      assigns(:users).should eq([@user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, {id: @user.to_param}, valid_session
      assigns(:user).should eq(@user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => @user.to_param}, valid_session
      assigns(:user).should eq(@user)
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.any_instance.should_receive(:update).with({ "name" => "Incredible Hulk" })
        put :update, {:id => @user.to_param, :user => { :name => "Incredible Hulk" }}, valid_session
      end

      it "assigns the requested user as @user" do
        put :update, {:id => @user.to_param, :user => valid_attributes}, valid_session
        assigns(:user).should eq(@user)
      end

      it "redirects to the user" do
        put :update, {:id => @user.to_param, :user => valid_attributes}, valid_session
        response.should redirect_to user_path(@user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => @user.to_param, :user => { user_id: "bad" }}, valid_session
        assigns(:user).should eq(@user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => { user_id: "bad" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, {:id => @user.to_param}, valid_session
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete :destroy, {:id => @user.to_param}, valid_session
      response.should redirect_to root_path
    end
  end

end
