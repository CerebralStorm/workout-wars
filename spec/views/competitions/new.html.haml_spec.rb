require 'spec_helper'

describe "competitions/new" do
  before(:each) do
    assign(:competition, stub_model(Competition,
      :name => "MyString",
      :max_participants => 1,
      :difficulty => "MyString",
      :private => false
    ).as_new_record)
  end

  it "renders new competition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", competitions_path, "post" do
      assert_select "input#competition_name[name=?]", "competition[name]"
      assert_select "input#competition_max_participants[name=?]", "competition[max_participants]"
      assert_select "input#competition_difficulty[name=?]", "competition[difficulty]"
      assert_select "input#competition_private[name=?]", "competition[private]"
    end
  end
end
