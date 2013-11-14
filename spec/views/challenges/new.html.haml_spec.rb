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
  end
end
