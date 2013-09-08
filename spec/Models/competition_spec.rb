require 'spec_helper'

describe Competition do
  context "validations" do
    it "should require a creator" do
      FactoryGirl.build(:competition, name: "").should_not be_valid
    end

    it "should require a creator" do
      FactoryGirl.build(:competition, creator_id: "").should_not be_valid
    end

    it "should require a start date" do
      FactoryGirl.build(:competition, start_date: "").should_not be_valid
    end

    it "should require a difficulty" do
      FactoryGirl.build(:competition, difficulty: "").should_not be_valid
    end

    it "should be valid with valid data" do
      FactoryGirl.build(:competition).should be_valid
    end
  end
end
