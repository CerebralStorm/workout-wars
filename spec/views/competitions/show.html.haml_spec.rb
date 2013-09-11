require 'spec_helper'

describe "competitions/show" do
  before(:each) do
    @competition = FactoryGirl.create(:competition)
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Difficulty/)
    rendered.should match(/false/)
  end
end
