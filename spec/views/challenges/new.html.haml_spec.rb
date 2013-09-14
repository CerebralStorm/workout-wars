require 'spec_helper'

describe "challenges/new" do
  before(:each) do
    assign(:challenge, stub_model(Challenge,
      :name => "MyString",
      :reward => 1,
      :difficulty_id => 1,
      :challenge_type_id => 1
    ).as_new_record)
  end

  it "renders new challenge form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", challenges_path, "post" do
      assert_select "input#challenge_name[name=?]", "challenge[name]"
      assert_select "input#challenge_reward[name=?]", "challenge[reward]"
      assert_select "input#challenge_difficulty_id[name=?]", "challenge[difficulty_id]"
      assert_select "input#challenge_challenge_type_id[name=?]", "challenge[challenge_type_id]"
    end
  end
end
