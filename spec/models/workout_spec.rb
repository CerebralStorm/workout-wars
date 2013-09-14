require 'spec_helper'

describe Workout do
  let(:workout) { FactoryGirl.create(:workout) }
  
  context "associations" do
    it 'should have many exercises' do
      Workout.reflect_on_association(:exercises).should_not be_nil
      Workout.reflect_on_association(:exercises).macro.should eql(:has_many)
    end

    it 'should belong to a user' do
      Workout.reflect_on_association(:user).should_not be_nil
      Workout.reflect_on_association(:user).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a date" do
      FactoryGirl.build(:workout, date: "").should_not be_valid
    end

    it "should belong to a user" do
      FactoryGirl.build(:workout, user_id: "").should_not be_valid
    end

    it "should be valid with a date, user, and exercises" do
      FactoryGirl.build(:workout).should be_valid
    end
  end

  context "experience" do 
    it "should get the xp from all exercises" do 
      workout.xp.should > 0
      workout.exercises.count.should == 2 # 2 from factory
    end
  end
end
