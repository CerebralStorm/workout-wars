require 'spec_helper'

describe Exercise do
  context "associations" do
    it 'should belong to a workout' do
      Exercise.reflect_on_association(:workout).should_not be_nil
      Exercise.reflect_on_association(:workout).macro.should eql(:belongs_to)
    end

    it 'should belong to a activity' do
      Exercise.reflect_on_association(:activity).should_not be_nil
      Exercise.reflect_on_association(:activity).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an activity" do
      FactoryGirl.build(:exercise, activity_id: "").should_not be_valid
    end
  end
end
