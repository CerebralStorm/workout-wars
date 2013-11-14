require 'spec_helper'

describe CompetableExercise do
  context "associations" do
    it 'should belong to an exercise_type' do
      CompetableExercise.reflect_on_association(:exercise_type).should_not be_nil
      CompetableExercise.reflect_on_association(:exercise_type).macro.should eql(:belongs_to)
    end

    it 'should belong to a competable (competition/challenge)' do
      CompetableExercise.reflect_on_association(:competable).should_not be_nil
      CompetableExercise.reflect_on_association(:competable).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:competable_exercise, exercise_type_id: "").should_not be_valid
    end

    it "should require a competable_id" do
      FactoryGirl.build(:competable_exercise, competable_id: "").should_not be_valid
    end

    it "should require a competable_type" do
      FactoryGirl.build(:competable_exercise, competable_type: "").should_not be_valid
    end

    it "should be valid with a user and competition" do
      FactoryGirl.build(:competable_exercise).should be_valid
    end
  end
end
