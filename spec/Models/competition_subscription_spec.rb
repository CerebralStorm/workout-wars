require 'spec_helper'

describe CompetitionSubscription do
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
