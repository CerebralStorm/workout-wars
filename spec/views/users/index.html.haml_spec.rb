require 'spec_helper'

describe "users/index.html.haml" do
  before do
    10.times do 
      FactoryGirl.create(:user)
    end
    @users = User.all
  end

  it "displays editing and the users name" do
    render
    expect(rendered).to match /Users/ 
  end
end
