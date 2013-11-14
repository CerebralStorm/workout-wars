require 'spec_helper'

describe Friendship do
  context "associations" do
    it 'should belong to a user' do
      Friendship.reflect_on_association(:category).should_not be_nil
      Friendship.reflect_on_association(:category).macro.should eql(:belongs_to)
    end

    it 'should belong to a friend' do
      Friendship.reflect_on_association(:exercises).should_not be_nil
      Friendship.reflect_on_association(:exercises).macro.should eql(:has_many)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:friendship, user: nil).should_not be_valid
    end

    it "should require a challenge" do
      FactoryGirl.build(:friendship, friend: nil).should_not be_valid
    end

    it "should be valid with valid data" do
      FactoryGirl.build(:friendship).should be_valid
    end
  end
end
