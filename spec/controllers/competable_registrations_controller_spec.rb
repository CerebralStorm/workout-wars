require 'spec_helper'

describe CompetableRegistrationsController do
  before do
    @user = FactoryGirl.create(:user) 
    @competition = FactoryGirl.create(:competition)
    sign_in @user
  end

  let(:valid_attributes) { { registerable_id: @competition.id, registerable_type: "Competition", user_id: @user.id } }
  let(:valid_session) { {} }  

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CompetableRegistration" do
        expect {
          post :create, {:competable_registration => valid_attributes}, valid_session
        }.to change(CompetableRegistration, :count).by(1)
      end

      it "redirects to the competition" do
        post :create, {:competable_registration => valid_attributes}, valid_session
        response.should redirect_to(Competition.last)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested competition" do
      subscription = CompetableRegistration.create! valid_attributes
      expect {
        delete :destroy, {:id => subscription.to_param}, valid_session
      }.to change(CompetableRegistration, :count).by(-1)
    end

    it "redirects to the competitions list" do
      subscription = CompetableRegistration.create! valid_attributes
      delete :destroy, {:id => subscription.to_param}, valid_session
      response.should redirect_to(@competition)
    end
  end

end
