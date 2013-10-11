require 'spec_helper'

describe "team_competitions/show" do
  before(:each) do
    @team_competition = assign(:team_competition, stub_model(TeamCompetition,
      :name => "Name",
      :end_date => "",
      :competition_type_id => 1,
      :number_of_team => 2,
      :lower_level_restriction => 3,
      :upper_level_restriction => 4,
      :active => false,
      :creator_id => 5,
      :winner_id => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/false/)
    rendered.should match(/5/)
    rendered.should match(/6/)
  end
end
