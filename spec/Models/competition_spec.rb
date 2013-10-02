require 'spec_helper'

describe Competition do
  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:competition, name: "").should_not be_valid
    end

    it "should be valid with valid data" do
      FactoryGirl.build(:competition).should be_valid
    end
  end

  context "individual registration" do
    it "should have a creator" do
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.build(:competition, creator_id: user.id)
      competition.creator.should == user
    end 

    it "should have registered users" do
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition)
      FactoryGirl.create(:competition_subscription, user: user, competition: competition)
      competition.users.should == [user]
      competition.registered?(user).should be_true
    end 
  end

  context "team registration" do
    it "should have registered teams" do
      user = FactoryGirl.create(:user)
      competition = FactoryGirl.create(:competition)
      FactoryGirl.create(:competition_subscription, user: user, competition: competition)
      competition.users.should == [user]
      competition.registered?(user).should be_true
    end 
  end
end
