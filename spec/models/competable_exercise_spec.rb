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
end
