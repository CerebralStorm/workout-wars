require 'spec_helper'

describe "workouts/edit" do
  before(:each) do
    @workout = FactoryGirl.build(:workout)
    @user = FactoryGirl.build(:user)
  end

  it "renders the edit workout form" do
    render
    expect(rendered).to match /Editing #{@user.name}/ 
  end
end
