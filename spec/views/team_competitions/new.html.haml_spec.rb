require 'spec_helper'

describe "team_competitions/new" do
  before(:each) do
    assign(:team_competition, stub_model(TeamCompetition,
      :name => "MyString",
      :end_date => "",
      :competition_type_id => 1,
      :number_of_team => 1,
      :lower_level_restriction => 1,
      :upper_level_restriction => 1,
      :active => false,
      :creator_id => 1,
      :winner_id => 1
    ).as_new_record)
  end

  it "renders new team_competition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", team_competitions_path, "post" do
      assert_select "input#team_competition_name[name=?]", "team_competition[name]"
      assert_select "input#team_competition_end_date[name=?]", "team_competition[end_date]"
      assert_select "input#team_competition_competition_type_id[name=?]", "team_competition[competition_type_id]"
      assert_select "input#team_competition_number_of_team[name=?]", "team_competition[number_of_team]"
      assert_select "input#team_competition_lower_level_restriction[name=?]", "team_competition[lower_level_restriction]"
      assert_select "input#team_competition_upper_level_restriction[name=?]", "team_competition[upper_level_restriction]"
      assert_select "input#team_competition_active[name=?]", "team_competition[active]"
      assert_select "input#team_competition_creator_id[name=?]", "team_competition[creator_id]"
      assert_select "input#team_competition_winner_id[name=?]", "team_competition[winner_id]"
    end
  end
end
