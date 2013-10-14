require 'spec_helper'

describe "competitions/new" do
  before(:each) do
    @competition = FactoryGirl.create(:competition)
  end

  it "renders new competition form" do
    #render

    # assert_select "form[action=?][method=?]", competitions_path, "post" do
    #   assert_select "input#competition_name[name=?]", "competition[name]"
    #   assert_select "input#competition_max_participants[name=?]", "competition[max_participants]"
    #   assert_select "input#competition_difficulty[name=?]", "competition[difficulty]"
    #   assert_select "input#competition_private[name=?]", "competition[private]"
    # end
  end
end
