require 'spec_helper'

describe Activity do
  context "validations" do
    it "should require a name" do
      FactoryGirl.build(:activity, name: "").should_not be_valid
    end
  end

  context "associations" do
    it 'should have many exercises' do
      Activity.reflect_on_association(:exercises).should_not be_nil
      Activity.reflect_on_association(:exercises).macro.should eql(:has_many)
    end
  end
end
