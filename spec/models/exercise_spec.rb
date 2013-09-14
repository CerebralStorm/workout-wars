require 'spec_helper'

describe Exercise do
  let(:exercise) {FactoryGirl.create(:exercise)}
  
  context "associations" do
    it 'should belong to a workout' do
      Exercise.reflect_on_association(:workout).should_not be_nil
      Exercise.reflect_on_association(:workout).macro.should eql(:belongs_to)
    end

    it 'should belong to a exercise type' do
      Exercise.reflect_on_association(:exercise_type).should_not be_nil
      Exercise.reflect_on_association(:exercise_type).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require an exercise type" do
      FactoryGirl.build(:exercise, exercise_type_id: "").should_not be_valid
    end
  end

  context "experience" do
    it "should calculate experience" do
      exercise.xp.should == 218
    end

    it "should get 0 xp from a nil metric" do
      exercise.xp_from(nil).should == 0
    end

    it "should get xp from reps experience" do
      exercise.xp_from(exercise.total_reps).should == 125
    end

    it "should get xp from distance experience" do
      exercise.xp_from(exercise.distance).should == 6
    end

    it "should get xp from duration experience" do
      exercise.xp_from(exercise.duration).should == 62
    end

    it "should get xp from weight experience" do
      exercise.xp_from(exercise.weight).should == 25
    end
  end
end
