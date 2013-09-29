require 'spec_helper'

describe Exercise do
  let(:user) {FactoryGirl.create(:user)}
  let(:exercise) {FactoryGirl.create(:exercise, user: user)}
  
  context "associations" do
    it 'should belong to a user' do
      Exercise.reflect_on_association(:user).should_not be_nil
      Exercise.reflect_on_association(:user).macro.should eql(:belongs_to)
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
    it "should have an xp transaction" do
      exercise.should respond_to(:xp_transactions)
    end

    it "should get 0 xp from a nil metric" do
      exercise.xp_from(nil).should == 0
    end

    it "should get xp from reps experience" do
      exercise.xp_from(exercise.reps).should == 20
    end

    it "should get xp from distance experience" do
      exercise.xp_from(exercise.distance).should == 5
    end

    it "should get xp from duration experience" do
      exercise.xp_from(exercise.duration).should == 50
    end

    it "should get xp from weight experience" do
      exercise.xp_from(exercise.weight).should == 20
    end
  end
end
