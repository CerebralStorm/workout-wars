require 'spec_helper'

describe RegistrationsController do
  before do
    @user = FactoryGirl.create(:user) 
    @competition = FactoryGirl.create(:competition)
    sign_in @user
  end

  let(:valid_attributes) { { competition_id: @competition.id, user_id: @user.id } }
  let(:valid_session) { {} }  

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Registration" do
        expect {
          post :create, {:registration => valid_attributes}, valid_session
        }.to change(Registration, :count).by(1)
      end

      it "redirects to the competition" do
        post :create, {:registration => valid_attributes}, valid_session
        response.should redirect_to(Competition.last)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested competition" do
      subscription = Registration.create! valid_attributes
      expect {
        delete :destroy, {:id => subscription.to_param}, valid_session
      }.to change(Registration, :count).by(-1)
    end

    it "redirects to the competitions list" do
      subscription = Registration.create! valid_attributes
      delete :destroy, {:id => subscription.to_param}, valid_session
      response.should redirect_to(@competition)
    end
  end

end
