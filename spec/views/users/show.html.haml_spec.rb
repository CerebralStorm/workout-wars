require 'spec_helper'

describe "users/show.html.haml" do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "displays editing and the users name" do
    render
    expect(rendered).to match /Profile for #{@user.name}/ 
  end
end
