require 'spec_helper'

describe ChallengeAttempt do
  let(:user) { FactoryGirl.create(:user) }
  let(:challenge) { FactoryGirl.create(:challenge) }
  let(:challenge_attempt) { FactoryGirl.create(:challenge_attempt) }

  context "associations" do
    it 'should belong to a user' do
      ChallengeAttempt.reflect_on_association(:user).should_not be_nil
      ChallengeAttempt.reflect_on_association(:user).macro.should eql(:belongs_to)
    end

    it 'should belong to a challenge' do
      ChallengeAttempt.reflect_on_association(:challenge).should_not be_nil
      ChallengeAttempt.reflect_on_association(:challenge).macro.should eql(:belongs_to)
    end
  end

  context "validations" do
    it "should require a user" do
      FactoryGirl.build(:challenge_attempt, user: nil).should_not be_valid
    end

    it "should require a challenge" do
      FactoryGirl.build(:challenge_attempt, challenge: nil).should_not be_valid
    end

    it "should be valid with valid data" do
      FactoryGirl.build(:challenge_attempt).should be_valid
    end
  end

  context "#formatted_completition_time" do
    it "should format the completion time" do 
      challenge_attempt.formatted_completition_time.should == "00:50:00"
    end

    it "should format 0 of a nil completition time" do 
      challenge_attempt.completion_time = nil
      challenge_attempt.formatted_completition_time.should == "00:00:00"
    end
  end
end
