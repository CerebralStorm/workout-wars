require 'spec_helper'

describe "competitions/index" do
  before(:each) do
    assign(:competitions, [
      stub_model(Competition,
        :name => "Name",
        :max_participants => 1,
        :difficulty => "Difficulty",
        :private => false
      ),
      stub_model(Competition,
        :name => "Name",
        :max_participants => 1,
        :difficulty => "Difficulty",
        :private => false
      )
    ])
  end

  it "renders a list of competitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Difficulty".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
