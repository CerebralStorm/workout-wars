require 'spec_helper'

describe "challenges/edit" do
  before(:each) do
    @challenge = assign(:challenge, stub_model(Challenge,
      :name => "MyString",
      :reward => 1,
      :difficulty_id => 1,
      :challenge_type_id => 1
    ))
  end

  it "renders the edit challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", challenge_path(@challenge), "post" do
      assert_select "input#challenge_name[name=?]", "challenge[name]"
      assert_select "input#challenge_reward[name=?]", "challenge[reward]"
      assert_select "input#challenge_difficulty_id[name=?]", "challenge[difficulty_id]"
      assert_select "input#challenge_challenge_type_id[name=?]", "challenge[challenge_type_id]"
    end
  end
end
