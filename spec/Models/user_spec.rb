require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }

  context "find_for_facebook_oauth" do
    # it "should find an existing user" do
    #   user.save
    #   result = User.find_for_facebook_oauth("facebook", "12345")
    #   result.should == user
    # end

    # it "should create a new user" do
    #   user.save
    #   result = User.find_for_facebook_oauth("facebook", "12345")
    #   result.should == user
    # end
  end

  context "associations" do
    it 'should have many workouts' do
      User.reflect_on_association(:workouts).should_not be_nil
      User.reflect_on_association(:workouts).macro.should eql(:has_many)
    end

    it 'should have many competitions' do
      User.reflect_on_association(:competitions).should_not be_nil
      User.reflect_on_association(:competitions).macro.should eql(:has_many)
    end

    it 'should belong to a user' do
      User.reflect_on_association(:competition_subscriptions).should_not be_nil
      User.reflect_on_association(:competition_subscriptions).macro.should eql(:has_many)
    end
  end

  context "validations" do
    it "should require an email address" do
      FactoryGirl.build(:user, email: "").should_not be_valid
    end

    it "should require a password at least 6 digits" do
      FactoryGirl.build(:user, password: "12345").should_not be_valid
      FactoryGirl.build(:user, password: "abcde").should_not be_valid
      FactoryGirl.build(:user, password: "abc123def").should be_valid
      FactoryGirl.build(:user, password: "Abc123deF").should be_valid
    end
  end

  context "experience" do
    it "should return my experience" do
      workout = FactoryGirl.create(:workout, user: user) 
      FactoryGirl.create(:exercise, workout: workout)
      user.xp.should == 218
    end
  end

  context "leveling up" do
    it "should increase my level when I earn enough experience" do
      workout = FactoryGirl.create(:workout, user: user) 
      3.times { FactoryGirl.create(:exercise, workout: workout) }
      user.xp.should == 654
      user.set_level
      user.xp_level.should == 2
      user.level.should == 2
    end
  end

end
