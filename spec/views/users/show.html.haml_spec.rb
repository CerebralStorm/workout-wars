require 'spec_helper'

describe "users/show.html.haml" do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "displays the users email" do
    render
    expect(rendered).to match /#{@user.email}/ 
  end
end
