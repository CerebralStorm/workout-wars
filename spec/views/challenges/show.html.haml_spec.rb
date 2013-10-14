require 'spec_helper'

describe "challenges/show" do
  before(:each) do
    @challenge = assign(:challenge, stub_model(Challenge,
      :name => "Name",
      :reward => 1,
      :difficulty_id => 2,
      :challenge_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    # render
    # # Run the generator again with the --webrat flag if you want to use webrat matchers
    # rendered.should match(/Name/)
    # rendered.should match(/1/)
    # rendered.should match(/2/)
    # rendered.should match(/3/)
  end
end
