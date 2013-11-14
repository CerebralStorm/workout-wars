require 'spec_helper'

describe "challenges/index" do
  before(:each) do
    @challenges = [ FactoryGirl.create(:challenge) ]
    assign(:challenges, @challenges)
  end

  it "renders a list of challenges" do
    render
  end
end
