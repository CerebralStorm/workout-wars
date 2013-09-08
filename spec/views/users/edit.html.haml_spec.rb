require 'spec_helper'

describe "users/edit.html.haml" do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "displays editing and the users name" do
    render
    expect(rendered).to match /Editing #{@user.name}/ 
  end

end
