require 'spec_helper'

describe "competitions/index" do
  before(:each) do
    competition1 = FactoryGirl.create(:competition)
    competition2 = FactoryGirl.create(:competition)
    assign(:competitions, [competition1, competition2])
  end

  it "renders a list of competitions" do
    render

    # assert_select "tr>td", :text => "Billy Bo Bob Battle Royal".to_s, :count => 2
    # assert_select "tr>td", :text => 1.to_s, :count => 2
    # assert_select "tr>td", :text => "Difficulty".to_s, :count => 2
    # assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
