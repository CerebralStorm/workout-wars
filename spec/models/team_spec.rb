require 'spec_helper'

describe Team do
  let(:team) { FactoryGirl.create(:team) }
  let(:user) { FactoryGirl.create(:user) }

  context "associations" do
    it 'should have many competable_registrations' do
      Team.reflect_on_association(:competable_registrations).should_not be_nil
      Team.reflect_on_association(:competable_registrations).macro.should eql(:has_many)
    end

    it 'should have many team_subscriptions' do
      Team.reflect_on_association(:users).should_not be_nil
      Team.reflect_on_association(:users).macro.should eql(:has_many)
    end

    it 'should belong_to a competition/challenge' do
      Team.reflect_on_association(:teamable).should_not be_nil
      Team.reflect_on_association(:teamable).macro.should eql(:belongs_to)
    end
  end

  context "registered?" do
    it 'should return true if a user is registered' do
      comp = FactoryGirl.create(:competition)
      CompetableRegistration.create!(team: team, user: user, registerable: comp)
      team.registered?(user).should be_true
    end

    it 'should return false if a user is not registered' do
      team.registered?(user).should be_false
    end
  end
end
