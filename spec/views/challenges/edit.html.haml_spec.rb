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
  end
end
