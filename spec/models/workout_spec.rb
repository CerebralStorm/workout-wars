require 'spec_helper'

describe Workout do
  context "validations" do
    it "should require a date" do
      FactoryGirl.build(:workout, date: "").should_not be_valid
    end

    it "should belong to a user" do
      FactoryGirl.build(:workout, user_id: "").should_not be_valid
    end

    it "should be valid with a date, user, and activities" do
      FactoryGirl.build(:workout).should be_valid
    end
  end
end
