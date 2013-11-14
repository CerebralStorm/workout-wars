require 'spec_helper'

describe ExerciseType do
  context "associations" do
    it 'should belong to a user' do
      ExerciseType.reflect_on_association(:user).should_not be_nil
      ExerciseType.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a challenge' do
      ExerciseType.reflect_on_association(:challenge).should_not be_nil
      ExerciseType.reflect_on_association(:challenge).macro.should eql(:belongs_to)
    end
  end
end
