require 'spec_helper'

describe "competitions/edit" do
  before(:each) do
    @competition = FactoryGirl.create(:competition)
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "renders the edit competition form" do
    render

    # assert_select "form[action=?][method=?]", competition_path(@competition), "post" do
    #   assert_select "input#competition_name[name=?]", "competition[name]"
    #   assert_select "input#competition_max_participants[name=?]", "competition[max_participants]"
    #   assert_select "input#competition_difficulty[name=?]", "competition[difficulty]"
    #   assert_select "input#competition_private[name=?]", "competition[private]"
    # end
  end
end
