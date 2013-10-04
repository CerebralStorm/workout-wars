require 'spec_helper'

describe TeamSubscription do
  let(:team_subscription) { FactoryGirl.create(:team_subscription, user: user, team: team)}
  let(:team) { FactoryGirl.create(:team) }
  let(:user) { FactoryGirl.create(:user) }

  context "associations" do
    it 'should belong to a user' do
      TeamSubscription.reflect_on_association(:user).should_not be_nil
      TeamSubscription.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a team' do
      TeamSubscription.reflect_on_association(:team).should_not be_nil
      TeamSubscription.reflect_on_association(:team).macro.should eql(:belongs_to)
    end
  end

  context "register" do
    it 'should have a user' do
      team_subscription.user.should == user
    end

    it 'should have a team' do
      team_subscription.team.should == team
    end
  end
end
