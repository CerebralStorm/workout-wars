require 'spec_helper'

describe "team_competitions/index" do
  before(:each) do
    assign(:team_competitions, [
      stub_model(TeamCompetition,
        :name => "Name",
        :end_date => "",
        :competition_type_id => 1,
        :number_of_team => 2,
        :lower_level_restriction => 3,
        :upper_level_restriction => 4,
        :active => false,
        :creator_id => 5,
        :winner_id => 6
      ),
      stub_model(TeamCompetition,
        :name => "Name",
        :end_date => "",
        :competition_type_id => 1,
        :number_of_team => 2,
        :lower_level_restriction => 3,
        :upper_level_restriction => 4,
        :active => false,
        :creator_id => 5,
        :winner_id => 6
      )
    ])
  end

  it "renders a list of team_competitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
