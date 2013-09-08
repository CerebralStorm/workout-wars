require 'spec_helper'

describe Activity do
  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:pushups, name: "").should_not be_valid
    end
  end
end
