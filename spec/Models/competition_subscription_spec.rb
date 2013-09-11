require 'spec_helper'

describe CompetitionSubscription do
  context "associations" do
    it 'should have many workouts' do
      CompetitionSubscription.reflect_on_association(:competition).should_not be_nil
      CompetitionSubscription.reflect_on_association(:competition).macro.should eql(:belongs_to)
    end

    it 'should have many competitions' do
      CompetitionSubscription.reflect_on_association(:user).should_not be_nil
      CompetitionSubscription.reflect_on_association(:user).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:competition_subscription, user_id: "").should_not be_valid
    end

    it "should require a competition" do
      FactoryGirl.build(:competition_subscription, competition_id: "").should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competition_subscription).should be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competition_subscription).should be_valid
    end
  end
end
