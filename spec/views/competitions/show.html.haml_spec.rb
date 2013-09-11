require 'spec_helper'

describe "competitions/show" do
  before(:each) do
    @competition = assign(:competition, stub_model(Competition,
      :name => "Name",
      :max_participants => 1,
      :difficulty => "Difficulty",
      :private => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Difficulty/)
    rendered.should match(/false/)
  end
end
