require 'spec_helper'

describe Team do
  let(:team) { FactoryGirl.create(:team) }
  let(:user) { FactoryGirl.create(:user) }

  context "associations" do
    it 'should have many competition_subscriptions' do
      Team.reflect_on_association(:competition_subscriptions).should_not be_nil
      Team.reflect_on_association(:competition_subscriptions).macro.should eql(:has_many)
    end

    it 'should have many team_subscriptions' do
      Team.reflect_on_association(:users).should_not be_nil
      Team.reflect_on_association(:users).macro.should eql(:has_many)
    end

    it 'should belong_to a competition' do
      Team.reflect_on_association(:competition).should_not be_nil
      Team.reflect_on_association(:competition).macro.should eql(:belongs_to)
    end
  end

  context "registered?" do
    it 'should return true if a user is registered' do
      comp = FactoryGirl.create(:competition)
      CompetitionSubscription.create!(team: team, user: user, competition: comp)
      team.registered?(user).should be_true
    end

    it 'should return false if a user is not registered' do
      team.registered?(user).should be_false
    end
  end
end
