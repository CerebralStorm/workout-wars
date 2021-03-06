require 'spec_helper'

describe ChallengesController do
  before do
    @user = FactoryGirl.create(:user) 
    sign_in @user
  end
  
  let(:valid_attributes) { { name: "Challenge" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all challenges as @challenges" do
      challenge = Challenge.create! valid_attributes
      get :index, {}, valid_session
      assigns(:challenges).should eq([challenge])
    end
  end

  describe "GET show" do
    it "assigns the requested challenge as @challenge" do
      challenge = Challenge.create! valid_attributes
      get :show, {:id => challenge.to_param}, valid_session
      assigns(:challenge).should eq(challenge)
    end
  end

  describe "GET new" do
    it "assigns a new challenge as @challenge" do
      get :new, {}, valid_session
      assigns(:challenge).should be_a_new(Challenge)
    end
  end

  describe "GET edit" do
    it "assigns the requested challenge as @challenge" do
      challenge = Challenge.create! valid_attributes
      get :edit, {:id => challenge.to_param}, valid_session
      assigns(:challenge).should eq(challenge)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Challenge" do
        expect {
          post :create, {:challenge => valid_attributes}, valid_session
        }.to change(Challenge, :count).by(1)
      end

      it "assigns a newly created challenge as @challenge" do
        post :create, {:challenge => valid_attributes}, valid_session
        assigns(:challenge).should be_a(Challenge)
        assigns(:challenge).should be_persisted
      end

      it "redirects to the created challenge" do
        post :create, {:challenge => valid_attributes}, valid_session
        response.should redirect_to(Challenge.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved challenge as @challenge" do
        # Trigger the behavior that occurs when invalid params are submitted
        Challenge.any_instance.stub(:save).and_return(false)
        post :create, {:challenge => { "name" => "invalid value" }}, valid_session
        assigns(:challenge).should be_a_new(Challenge)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Challenge.any_instance.stub(:save).and_return(false)
        post :create, {:challenge => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested challenge" do
        challenge = Challenge.create! valid_attributes
        # Assuming there are no other challenges in the database, this
        # specifies that the Challenge created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Challenge.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => challenge.to_param, :challenge => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested challenge as @challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => valid_attributes}, valid_session
        assigns(:challenge).should eq(challenge)
      end

      it "redirects to the challenge" do
        challenge = Challenge.create! valid_attributes
        put :update, {:id => challenge.to_param, :challenge => valid_attributes}, valid_session
        response.should redirect_to(challenge)
      end
    end

    describe "with invalid params" do
      it "assigns the challenge as @challenge" do
        challenge = Challenge.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Challenge.any_instance.stub(:save).and_return(false)
        put :update, {:id => challenge.to_param, :challenge => { "name" => "invalid value" }}, valid_session
        assigns(:challenge).should eq(challenge)
      end

      it "re-renders the 'edit' template" do
        challenge = Challenge.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Challenge.any_instance.stub(:save).and_return(false)
        put :update, {:id => challenge.to_param, :challenge => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested challenge" do
      challenge = Challenge.create! valid_attributes
      expect {
        delete :destroy, {:id => challenge.to_param}, valid_session
      }.to change(Challenge, :count).by(-1)
    end

    it "redirects to the challenges list" do
      challenge = Challenge.create! valid_attributes
      delete :destroy, {:id => challenge.to_param}, valid_session
      response.should redirect_to(challenges_url)
    end
  end

end
